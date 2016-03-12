interface avalon_mm_if #(
  parameter ADDR_WIDTH        = 32,
  parameter DATA_WIDTH        = 64,
  parameter BURST_COUNT_WIDTH = 8,
  parameter BYTE_ENABLE_WIDTH = DATA_WIDTH/8
)
( );

logic                          clk;
logic [ADDR_WIDTH-1:0]         address;
logic [BURST_COUNT_WIDTH-1:0]  burstcount;
logic [DATA_WIDTH-1:0]         writedata;
logic [DATA_WIDTH-1:0]         readdata;

logic [BYTE_ENABLE_WIDTH-1:0]  byteenable;

logic                          readdatavalid;
logic                          write;
logic                          read;
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

endinterface
