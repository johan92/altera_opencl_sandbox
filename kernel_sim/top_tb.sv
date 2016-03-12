`timescale 1 ps / 1 ps

module top_tb;

logic kernel_clk;
logic gmem_clk;
logic rst;
bit   rst_done;
bit   dut_ready;

logic ram_init_done = 1'b1;
logic ram_cal_success = 1'b1;

logic [3:0]  cra_addr;
logic [63:0] cra_wr_data;
logic [7:0]  cra_byteenable;
logic        cra_wr_en;

localparam SDRAM_DATA_W = 256;
localparam SDRAM_ADDR_W = 32;
localparam RAM_TYPE     = "onchip_ram_256b";

avalon_mm_if #(
  .ADDR_WIDTH        ( SDRAM_ADDR_W ),
  .DATA_WIDTH        ( SDRAM_DATA_W ),
  .BURST_COUNT_WIDTH ( 1            )
) host_sdram_if( );

avalon_mm_if #(
  .ADDR_WIDTH        ( SDRAM_ADDR_W ),
  .DATA_WIDTH        ( SDRAM_DATA_W ),
  .BURST_COUNT_WIDTH ( 5            )
) kernel_sdram_if( );

initial
  begin
    kernel_clk = 1'b0;
    forever 
      begin
        #3.5ns
        kernel_clk = !kernel_clk;
      end
  end

// now global memory clock is kernel clock
// TODO: make it separte and use avalon-mm clockcrossing bridge
assign gmem_clk = kernel_clk;

//initial
//  begin
//    gmem_clk = 1'b0;
//    forever 
//      begin
//        #5ns
//        gmem_clk = !gmem_clk; 
//      end
//  end

initial
  begin
    rst <= 1'b1;
    @( posedge kernel_clk );
    @( posedge kernel_clk );
    @( negedge kernel_clk );
    rst <= 1'b0;

    rst_done <= 1'b1;
  end

task cra_write( input bit [3:0] _addr, bit [63:0] _data, bit [7:0] _byteenable );
  $display("%m: _addr = 0x%x, _data = 0x%x, _byteenable = 0x%x", 
                _addr,        _data,        _byteenable );

  @( posedge kernel_clk );
  cra_addr        <= _addr;
  cra_wr_data     <= _data;
  cra_byteenable  <= _byteenable;
  cra_wr_en       <= 1'b0;

  @( posedge kernel_clk );
  cra_wr_en       <= 1'b1;
  
  @( posedge kernel_clk );
  cra_wr_en       <= 1'b0;
  
  // dummy waiting 
  repeat (10) @( posedge kernel_clk );
endtask

bit [7:0][31:0] test_data;


task write_test_data( );
  @( posedge gmem_clk );

  for( int j = 0; j < 8; j++ )
    begin
      test_data[ j ] = test_data[j] + 1'd1 + j;
    end

  host_sdram_if.writedata <= test_data;
  host_sdram_if.write      <= 1'b0;
  
  @( posedge gmem_clk );
  host_sdram_if.write      <= 1'b1;

  @( posedge gmem_clk );

  while( host_sdram_if.waitrequest == 1'b1 )
    begin
      @( posedge gmem_clk );
    end

  host_sdram_if.write      <= 1'b0;

  repeat (5) @( posedge gmem_clk );
endtask

bit test_data_init_done;

initial
  begin
    wait( ram_init_done );
    host_sdram_if.address <= 32'h0;

    for( int i = 0; i < 256; i++ )
      begin
        write_test_data( );
        host_sdram_if.address <= host_sdram_if.address + 32'h20;
      end

    host_sdram_if.address <= 32'h400000;
    for( int i = 0; i < 256; i++ )
      begin
        write_test_data( );
        host_sdram_if.address <= host_sdram_if.address + 32'h20;
      end

    test_data_init_done = 1'b1;
  end

initial
  begin
    cra_addr       = '0;
    cra_wr_data    = '0;
    cra_byteenable = '0;
    cra_wr_en      = '0;
  end

initial
  begin
    wait( ram_init_done );
    wait( test_data_init_done );
    cra_write( 4'h5, 64'h000F424000000000, 8'hF0 ); 
    cra_write( 4'h5, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h6, 64'h00000000000F4240, 8'h0F ); 
    cra_write( 4'h6, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h7, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'h7, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h8, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'h8, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h9, 64'h00000000000F4240, 8'h0F ); 
    cra_write( 4'h9, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'hA, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'hA, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hB, 64'h0000000000000000, 8'h0F ); 
    cra_write( 4'hB, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hC, 64'h0000000000000000, 8'h0F ); 
    cra_write( 4'hC, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hD, 64'h0000000000400000, 8'h0F ); 
    cra_write( 4'hD, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hE, 64'h0000000000800000, 8'h0F ); 
    cra_write( 4'hE, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'h0, 64'h0000000000000001, 8'h0F ); 
  end

vector_add_system dut(

  .clock                                  ( kernel_clk                    ),
  .clock2x                                ( 1'b0                          ),
  .resetn                                 ( ~rst                          ),
  
  .avs_vector_add_cra_read                ( 1'b0                          ),
  .avs_vector_add_cra_write               ( cra_wr_en                     ),
  .avs_vector_add_cra_address             ( cra_addr                      ),
  .avs_vector_add_cra_writedata           ( cra_wr_data                   ),
  .avs_vector_add_cra_byteenable          ( cra_byteenable                ),
  .avs_vector_add_cra_readdata            (                               ),
  .avs_vector_add_cra_readdatavalid       (                               ),
  
  .kernel_irq                             ( kernel_irq                    ),

  .avm_memgmem0_port_0_0_rw_read          ( kernel_sdram_if.read          ),
  .avm_memgmem0_port_0_0_rw_write         ( kernel_sdram_if.write         ),
  .avm_memgmem0_port_0_0_rw_burstcount    ( kernel_sdram_if.burstcount    ),
  .avm_memgmem0_port_0_0_rw_address       ( kernel_sdram_if.address       ),
  .avm_memgmem0_port_0_0_rw_writedata     ( kernel_sdram_if.writedata     ),
  .avm_memgmem0_port_0_0_rw_byteenable    ( kernel_sdram_if.byteenable    ),
  .avm_memgmem0_port_0_0_rw_waitrequest   ( kernel_sdram_if.waitrequest   ),
  .avm_memgmem0_port_0_0_rw_readdata      ( kernel_sdram_if.readdata      ),
  .avm_memgmem0_port_0_0_rw_readdatavalid ( kernel_sdram_if.readdatavalid ),
  .avm_memgmem0_port_0_0_rw_writeack      ( 1'bx                          )
);


generate 
  if( RAM_TYPE == "onchip_ram_256b" )
    begin
      onchip_ram_256b ram(

        .clk_clk                                ( gmem_clk                    ),
        .reset_reset_n                          ( !rst                        ),

        .host_bridge_1_s0_waitrequest           ( host_sdram_if.waitrequest   ),
        .host_bridge_1_s0_readdata              ( host_sdram_if.readdata      ),
        .host_bridge_1_s0_readdatavalid         ( host_sdram_if.readdatavalid ),
        .host_bridge_1_s0_burstcount            ( host_sdram_if.burstcount    ),
        .host_bridge_1_s0_writedata             ( host_sdram_if.writedata     ),
        .host_bridge_1_s0_address               ( host_sdram_if.address       ),
        .host_bridge_1_s0_write                 ( host_sdram_if.write         ),
        .host_bridge_1_s0_read                  ( host_sdram_if.read          ),
        .host_bridge_1_s0_byteenable            ( host_sdram_if.byteenable    ),
        .host_bridge_1_s0_debugaccess           (                             ),

        .kernel_bridge_s0_waitrequest           ( kernel_sdram_if.waitrequest   ),
        .kernel_bridge_s0_readdata              ( kernel_sdram_if.readdata      ),
        .kernel_bridge_s0_readdatavalid         ( kernel_sdram_if.readdatavalid ),
        .kernel_bridge_s0_burstcount            ( kernel_sdram_if.burstcount    ),
        .kernel_bridge_s0_writedata             ( kernel_sdram_if.writedata     ),
        .kernel_bridge_s0_address               ( kernel_sdram_if.address       ),
        .kernel_bridge_s0_write                 ( kernel_sdram_if.write         ),
        .kernel_bridge_s0_read                  ( kernel_sdram_if.read          ),
        .kernel_bridge_s0_byteenable            ( kernel_sdram_if.byteenable    ),
        .kernel_bridge_s0_debugaccess           ( )
      );
    end

    initial
      begin
        wait( rst_done );
        repeat( 5 ) @( gmem_clk );

        ram_init_done   = 1'b1;
        ram_cal_success = 1'b1;
      end

endgenerate

endmodule
