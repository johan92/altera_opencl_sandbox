interface avalon_mm_if #(
  parameter ADDR_WIDTH        = 32,
  parameter DATA_WIDTH        = 64,
  parameter BURST_COUNT_WIDTH = 8,
  parameter BYTE_ENABLE_WIDTH = DATA_WIDTH/8
)
( );

// HACK:
// using wire here to get of modelsim error:
// "written by continuous and procedural assignments"
// this error happend because signals `address`, `writedata`, etc
// got two variant to set:
//   - from clocking block
//   - from wire
//
// idea from:
// http://verificationguild.com/modules.php?name=Forums&file=viewtopic&p=21149

logic                          clk;
wire  [ADDR_WIDTH-1:0]         address;
wire  [BURST_COUNT_WIDTH-1:0]  burstcount;
wire  [DATA_WIDTH-1:0]         writedata;
logic [DATA_WIDTH-1:0]         readdata;

wire  [BYTE_ENABLE_WIDTH-1:0]  byteenable;

logic                          readdatavalid;
wire                           write;
wire                           read;
logic                          waitrequest;

modport master(
  output  clk,
          address,
          burstcount,
          writedata,
          byteenable,
          write,
          read,

  input   waitrequest,
          readdata,
          readdatavalid

);


modport slave(
  input   clk,
          address,
          burstcount,
          writedata,
          byteenable,
          write,
          read,

  output  waitrequest,
          readdata,
          readdatavalid

);

clocking cb @( posedge clk );
  output  address,
          burstcount,
          writedata,
          byteenable,
          write,
          read;

  input   waitrequest,
          readdata,
          readdatavalid;
endclocking 

task write_word( input bit [ADDR_WIDTH-1:0]         _addr, 
                       bit [DATA_WIDTH-1:0]         _data,
                       bit [BYTE_ENABLE_WIDTH-1:0]  _byteenable = '1,
                       bit                          _verbose    = 1'b0
               );
  
  if( _verbose )
    begin
      $display("%m: _addr = 0x%x, _data = 0x%x, _byteenable = 0x%x", 
                    _addr,        _data,        _byteenable );
    end

  cb.read       <= 1'b0;

  cb.address    <= _addr;
  cb.writedata  <= _data;
  cb.write      <= 1'b0;
  cb.byteenable <= _byteenable;

  @( cb );
  cb.write     <= 1'b1;
  
  @( cb );
  while( cb.waitrequest == 1'b1 )
    begin
      @( cb );
    end
  
  cb.write     <= 1'b0;

endtask

endinterface
