`timescale 1 ps / 1 ps

module top_tb;

logic kernel_clk;
logic gmem_clk;
logic rst;
bit   rst_done;
bit   dut_ready;

logic ram_init_done;
logic ram_cal_success;

logic [3:0]  cra_addr;
logic [63:0] cra_wr_data;
logic [7:0]  cra_byteenable;
logic        cra_wr_en;

initial
  begin
    kernel_clk = 1'b0;
    forever 
      begin
        #3.5ns
        kernel_clk = !kernel_clk;
      end
  end

initial
  begin
    gmem_clk = 1'b0;
    forever 
      begin
        #5ns
        gmem_clk = !gmem_clk; 
      end
  end

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


//task write_test_data( );
//  @( posedge gmem_clk );
//
//  for( int j = 0; j < 8; j++ )
//    begin
//      test_data[ j ] = test_data[j] + 1'd1 + j;
//    end
//
//  read_master_sdram_if.write_data <= test_data;
//  read_master_sdram_if.write      <= 1'b0;
//  
//  @( posedge gmem_clk );
//  read_master_sdram_if.write      <= 1'b1;
//
//  @( posedge gmem_clk );
//
//  while( read_master_sdram_if.wait_request == 1'b1 )
//    begin
//      @( posedge gmem_clk );
//    end
//
//  read_master_sdram_if.write      <= 1'b0;
//
//  repeat (5) @( posedge gmem_clk );
//endtask
//
bit test_data_init_done;
//
//initial
//  begin
//    wait( ram_init_done );
//    read_master_sdram_if.address <= 32'h20100000;
//
//    for( int i = 0; i < 256; i++ )
//      begin
//        write_test_data( );
//        read_master_sdram_if.address <= read_master_sdram_if.address + 32'h20;
//      end
//
//    read_master_sdram_if.address <= 32'h20500000;
//    for( int i = 0; i < 256; i++ )
//      begin
//        write_test_data( );
//        read_master_sdram_if.address <= read_master_sdram_if.address + 32'h20;
//      end
//
//    test_data_init_done = 1'b1;
//  end

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
    //cra_write( 4'h5, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'h5, 64'h000F424000000000, 8'hF0 ); // ORIG
    cra_write( 4'h5, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h6, 64'h00000000000F4240, 8'h0F ); 
    cra_write( 4'h6, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h7, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'h7, 64'h0000000100000000, 8'hF0 ); // ORIG
    //cra_write( 4'h7, 64'h000F424000000000, 8'hF0 ); 
    cra_write( 4'h8, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'h8, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'h9, 64'h00000000000F4240, 8'h0F ); // ORIG 
    cra_write( 4'h9, 64'h0000000100000000, 8'hF0 ); // ORIG
    //cra_write( 4'h9, 64'h0000000000000001, 8'h0F ); 
    //cra_write( 4'h9, 64'h0000000100000000, 8'hF0 ); 
    cra_write( 4'hA, 64'h0000000000000001, 8'h0F ); 
    cra_write( 4'hA, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hB, 64'h0000000000000000, 8'h0F ); 
    cra_write( 4'hB, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hC, 64'h0000000020100000, 8'h0F ); 
    cra_write( 4'hC, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hD, 64'h0000000020500000, 8'h0F ); 
    cra_write( 4'hD, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'hE, 64'h0000000020900000, 8'h0F ); 
    cra_write( 4'hE, 64'h0000000000000000, 8'hF0 ); 
    cra_write( 4'h0, 64'h0000000000000001, 8'h0F ); 
  end

vector_add_system dut(

  .clock                                  ( clk              ),
  .clock2x                                ( 1'b0             ),
  .resetn                                 ( ~rst             ),
     // AVS avs_vectorAdd_cra
  .avs_vector_add_cra_read                 ( 1'b0 ),
  .avs_vector_add_cra_write                ( cra_wr_en      ),
  .avs_vector_add_cra_address              ( cra_addr       ),
  .avs_vector_add_cra_writedata            ( cra_wr_data    ),
  .avs_vector_add_cra_byteenable           ( cra_byteenable ),
  .avs_vector_add_cra_readdata             ( ),
  .avs_vector_add_cra_readdatavalid        ( ),
  
  //.avs_vectorAdd_cra_read                 ( 1'b0 ),
  //.avs_vectorAdd_cra_write                ( cra_wr_en      ),
  //.avs_vectorAdd_cra_address              ( cra_addr       ),
  //.avs_vectorAdd_cra_writedata            ( cra_wr_data    ),
  //.avs_vectorAdd_cra_byteenable           ( cra_byteenable ),
  //.avs_vectorAdd_cra_readdata             ( ),
  //.avs_vectorAdd_cra_readdatavalid        ( ),
  
  .kernel_irq                             ( kernel_irq        )

     // AVM avm_memgmem0_port_0_0_rw
//  .avm_memgmem0_port_0_0_rw_read          ( kernel_write_master_sdram_if.read         ),
//  .avm_memgmem0_port_0_0_rw_write         ( kernel_write_master_sdram_if.write        ),
//  .avm_memgmem0_port_0_0_rw_burstcount    ( kernel_write_master_sdram_if.burst_count  ),
//  .avm_memgmem0_port_0_0_rw_address       ( kernel_write_master_sdram_if.address      ),
//  .avm_memgmem0_port_0_0_rw_writedata     ( kernel_write_master_sdram_if.write_data   ),
//  .avm_memgmem0_port_0_0_rw_byteenable    ( kernel_write_master_sdram_if.byte_enable  ),
//  .avm_memgmem0_port_0_0_rw_waitrequest   ( kernel_write_master_sdram_if.wait_request ),
//  .avm_memgmem0_port_0_0_rw_readdata      ( kernel_write_master_sdram_if.read_data    ),
//  .avm_memgmem0_port_0_0_rw_readdatavalid ( kernel_write_master_sdram_if.readdata_val ),
//  .avm_memgmem0_port_0_0_rw_writeack      ( 1'bx )
);
endmodule
