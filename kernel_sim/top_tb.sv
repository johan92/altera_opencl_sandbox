//-----------------------------------------------------------------------------
// Project       : aocl-kernel-sim
//-----------------------------------------------------------------------------
// Author        : Ivan Shevchuk (github/johan92)
//-----------------------------------------------------------------------------

`timescale 1 ps / 1 ps

module top_tb;

bit kernel_clk;
bit kernel_clk_x2;
bit kernel_clk_x4;
logic gmem_clk;
logic rst;
bit   rst_done;
bit   dut_ready;

logic ram_init_done = 1'b1;
logic ram_cal_success = 1'b1;

logic [7:0]  cra_addr;
logic [63:0] cra_wr_data;
logic [7:0]  cra_byteenable;
logic        cra_wr_en;

localparam SDRAM_DATA_W = 256;
localparam SDRAM_ADDR_W = 32;
localparam RAM_TYPE     = "onchip_ram_256b";

// if timescale is 1 ps to get here 5 ns need here write 5000 
localparam KERNEL_CLK_PERIOD = 5000;

// interface for loading data in global memory before kernels starts 
avalon_mm_if #(
  .ADDR_WIDTH        ( SDRAM_ADDR_W ),
  .DATA_WIDTH        ( 32           ),
  .BURST_COUNT_WIDTH ( 1            )
) host_sdram_if( );

// interface from kernel to global memory
avalon_mm_if #(
  .ADDR_WIDTH        ( SDRAM_ADDR_W ),
  .DATA_WIDTH        ( SDRAM_DATA_W ),
  .BURST_COUNT_WIDTH ( 5            )
) kernel_sdram_if( );

avalon_mm_if #(
  .ADDR_WIDTH        ( 8      ),
  .DATA_WIDTH        ( 64     ),
  .BURST_COUNT_WIDTH ( 1      )
) cra_if( );

assign host_sdram_if.clk   = gmem_clk;
assign kernel_sdram_if.clk = kernel_clk;
assign cra_if.clk          = kernel_clk;

initial
  begin
    kernel_clk_x4 = 1'b0;
    forever
      begin
        #((KERNEL_CLK_PERIOD/2)/2)
        kernel_clk_x2 = !kernel_clk_x2;
        kernel_clk    = !kernel_clk;
        #((KERNEL_CLK_PERIOD/2)/2)
        kernel_clk_x2 = !kernel_clk_x2;
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

bit test_data_init_done;

initial
  begin
    wait( rst_done      );
    wait( ram_init_done );

    repeat(10) @( posedge host_sdram_if.clk );
    
    // initialize first buffer
    for( int i = 0; i < 128; i++ )
      begin
        host_sdram_if.write_word( 32'h0 + ( i * 4 ), i );
      end
    
    // initialize second buffer
    for( int i = 0; i < 128; i++ )
      begin
        host_sdram_if.write_word( 32'h1000 + ( i * 4 ), 2*i + 1 );
      end

    test_data_init_done = 1'b1;
  end

assign host_sdram_if.burstcount = 1'd1;

initial
  begin
    wait( ram_init_done );
    wait( test_data_init_done );
    cra_if.write_word( 4'h5, 64'h0000000100000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'h6, 64'h0000000000000001, 8'h0F, 1 ); 
    cra_if.write_word( 4'h6, 64'h0000000100000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'h7, 64'h0000000000000001, 8'h0F, 1 ); 
    cra_if.write_word( 4'h7, 64'h0000000100000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'h8, 64'h0000000000000001, 8'h0F, 1 ); 
    cra_if.write_word( 4'h8, 64'h0000000100000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'h9, 64'h0000000000000001, 8'h0F, 1 ); 
    cra_if.write_word( 4'h9, 64'h0000000100000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'hA, 64'h0000000000000001, 8'h0F, 1 ); 
    cra_if.write_word( 4'hA, 64'h0000000000000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'hB, 64'h0000000000000000, 8'h0F, 1 ); 
    cra_if.write_word( 4'hB, 64'h0000000000000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'hC, 64'h0000000000000000, 8'h0F, 1 ); 
    cra_if.write_word( 4'hC, 64'h0000000000000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'hD, 64'h0000000000001000, 8'h0F, 1 ); 
    cra_if.write_word( 4'hD, 64'h0000000000000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'hE, 64'h000000000001f480, 8'h0F, 1 ); 
    cra_if.write_word( 4'hE, 64'h0000000000000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'hF, 64'h0000000000002000, 8'h0F, 1 ); 
    cra_if.write_word( 4'hF, 64'h0000000000000000, 8'hF0, 1 ); 
    cra_if.write_word( 4'h0, 64'h0000000000000001, 8'h0F, 1 ); 
  end

// renaming lsu_top modules to more adequate names =)
initial
  begin
    #1ns;

    //top_tb.dut.k.kernel.k_function_inst0.k_basic_block_1.lsu_local_bb1_ld_.set_inst_name( "load_0" );
    //top_tb.dut.vector_add.kernel.vector_add_function_inst0.vector_add_basic_block_0.lsu_local_bb0_ld_.set_inst_name( "load_a" );
    //top_tb.dut.vector_add.kernel.vector_add_function_inst0.vector_add_basic_block_0.lsu_local_bb0_ld__u0.set_inst_name( "load_b" );
    //top_tb.dut.vector_add.kernel.vector_add_function_inst0.vector_add_basic_block_0.lsu_local_bb0_st_add.set_inst_name( "write_c" );
  end


vector_add_system dut(
//k_system dut(

  .clock                                  ( kernel_clk                    ),
  .clock2x                                ( kernel_clk_x2                 ),
  .resetn                                 ( ~rst                          ),
  
  .avs_vector_add_cra_read                ( cra_if.read                   ),
  .avs_vector_add_cra_write               ( cra_if.write                  ),
  .avs_vector_add_cra_address             ( cra_if.address                ),
  .avs_vector_add_cra_writedata           ( cra_if.writedata              ),
  .avs_vector_add_cra_byteenable          ( cra_if.byteenable             ),
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

// no waitrequest signal in cra_kernel_system, so, suggest it is zero
assign cra_if.waitrequest = 1'b0;

generate 
  if( RAM_TYPE == "onchip_ram_256b" )
    begin
      onchip_ram_256b ram(

        .clk_clk                                ( host_sdram_if.clk           ),
        .reset_reset_n                          ( !rst                        ),

        .host_bridge_s0_waitrequest             ( host_sdram_if.waitrequest   ),
        .host_bridge_s0_readdata                ( host_sdram_if.readdata      ),
        .host_bridge_s0_readdatavalid           ( host_sdram_if.readdatavalid ),
        .host_bridge_s0_burstcount              ( host_sdram_if.burstcount    ),
        .host_bridge_s0_writedata               ( host_sdram_if.writedata     ),
        .host_bridge_s0_address                 ( host_sdram_if.address       ),
        .host_bridge_s0_write                   ( host_sdram_if.write         ),
        .host_bridge_s0_read                    ( host_sdram_if.read          ),
        .host_bridge_s0_byteenable              ( host_sdram_if.byteenable    ),
        .host_bridge_s0_debugaccess             (                             ),

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
        repeat( 5 ) @( host_sdram_if.clk );

        ram_init_done   = 1'b1;
        ram_cal_success = 1'b1;
      end

endgenerate

endmodule
