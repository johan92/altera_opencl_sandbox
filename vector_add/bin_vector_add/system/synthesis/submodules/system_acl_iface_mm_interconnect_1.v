// system_acl_iface_mm_interconnect_1.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 14.1 186 at 2015.10.17.22:27:08

`timescale 1 ps / 1 ps
module system_acl_iface_mm_interconnect_1 (
		input  wire         pll_outclk0_clk,                                              //                                            pll_outclk0.clk
		input  wire         clock_cross_kernel_mem1_m0_reset_reset_bridge_in_reset_reset, // clock_cross_kernel_mem1_m0_reset_reset_bridge_in_reset.reset
		input  wire [29:0]  clock_cross_kernel_mem1_m0_address,                           //                             clock_cross_kernel_mem1_m0.address
		output wire         clock_cross_kernel_mem1_m0_waitrequest,                       //                                                       .waitrequest
		input  wire [4:0]   clock_cross_kernel_mem1_m0_burstcount,                        //                                                       .burstcount
		input  wire [31:0]  clock_cross_kernel_mem1_m0_byteenable,                        //                                                       .byteenable
		input  wire         clock_cross_kernel_mem1_m0_read,                              //                                                       .read
		output wire [255:0] clock_cross_kernel_mem1_m0_readdata,                          //                                                       .readdata
		output wire         clock_cross_kernel_mem1_m0_readdatavalid,                     //                                                       .readdatavalid
		input  wire         clock_cross_kernel_mem1_m0_write,                             //                                                       .write
		input  wire [255:0] clock_cross_kernel_mem1_m0_writedata,                         //                                                       .writedata
		input  wire         clock_cross_kernel_mem1_m0_debugaccess,                       //                                                       .debugaccess
		output wire [24:0]  address_span_extender_kernel_windowed_slave_address,          //            address_span_extender_kernel_windowed_slave.address
		output wire         address_span_extender_kernel_windowed_slave_write,            //                                                       .write
		output wire         address_span_extender_kernel_windowed_slave_read,             //                                                       .read
		input  wire [255:0] address_span_extender_kernel_windowed_slave_readdata,         //                                                       .readdata
		output wire [255:0] address_span_extender_kernel_windowed_slave_writedata,        //                                                       .writedata
		output wire [4:0]   address_span_extender_kernel_windowed_slave_burstcount,       //                                                       .burstcount
		output wire [31:0]  address_span_extender_kernel_windowed_slave_byteenable,       //                                                       .byteenable
		input  wire         address_span_extender_kernel_windowed_slave_readdatavalid,    //                                                       .readdatavalid
		input  wire         address_span_extender_kernel_windowed_slave_waitrequest       //                                                       .waitrequest
	);

	wire          clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_waitrequest;   // address_span_extender_kernel_windowed_slave_translator:uav_waitrequest -> clock_cross_kernel_mem1_m0_translator:uav_waitrequest
	wire  [255:0] clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_readdata;      // address_span_extender_kernel_windowed_slave_translator:uav_readdata -> clock_cross_kernel_mem1_m0_translator:uav_readdata
	wire          clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_debugaccess;   // clock_cross_kernel_mem1_m0_translator:uav_debugaccess -> address_span_extender_kernel_windowed_slave_translator:uav_debugaccess
	wire   [29:0] clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_address;       // clock_cross_kernel_mem1_m0_translator:uav_address -> address_span_extender_kernel_windowed_slave_translator:uav_address
	wire          clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_read;          // clock_cross_kernel_mem1_m0_translator:uav_read -> address_span_extender_kernel_windowed_slave_translator:uav_read
	wire   [31:0] clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_byteenable;    // clock_cross_kernel_mem1_m0_translator:uav_byteenable -> address_span_extender_kernel_windowed_slave_translator:uav_byteenable
	wire          clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_readdatavalid; // address_span_extender_kernel_windowed_slave_translator:uav_readdatavalid -> clock_cross_kernel_mem1_m0_translator:uav_readdatavalid
	wire          clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_lock;          // clock_cross_kernel_mem1_m0_translator:uav_lock -> address_span_extender_kernel_windowed_slave_translator:uav_lock
	wire          clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_write;         // clock_cross_kernel_mem1_m0_translator:uav_write -> address_span_extender_kernel_windowed_slave_translator:uav_write
	wire  [255:0] clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_writedata;     // clock_cross_kernel_mem1_m0_translator:uav_writedata -> address_span_extender_kernel_windowed_slave_translator:uav_writedata
	wire    [9:0] clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_burstcount;    // clock_cross_kernel_mem1_m0_translator:uav_burstcount -> address_span_extender_kernel_windowed_slave_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (30),
		.AV_DATA_W                   (256),
		.AV_BURSTCOUNT_W             (5),
		.AV_BYTEENABLE_W             (32),
		.UAV_ADDRESS_W               (30),
		.UAV_BURSTCOUNT_W            (10),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (1),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (32),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (1),
		.UAV_CONSTANT_BURST_BEHAVIOR (1),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) clock_cross_kernel_mem1_m0_translator (
		.clk                    (pll_outclk0_clk),                                                               //                       clk.clk
		.reset                  (clock_cross_kernel_mem1_m0_reset_reset_bridge_in_reset_reset),                  //                     reset.reset
		.uav_address            (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (clock_cross_kernel_mem1_m0_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (clock_cross_kernel_mem1_m0_waitrequest),                                        //                          .waitrequest
		.av_burstcount          (clock_cross_kernel_mem1_m0_burstcount),                                         //                          .burstcount
		.av_byteenable          (clock_cross_kernel_mem1_m0_byteenable),                                         //                          .byteenable
		.av_read                (clock_cross_kernel_mem1_m0_read),                                               //                          .read
		.av_readdata            (clock_cross_kernel_mem1_m0_readdata),                                           //                          .readdata
		.av_readdatavalid       (clock_cross_kernel_mem1_m0_readdatavalid),                                      //                          .readdatavalid
		.av_write               (clock_cross_kernel_mem1_m0_write),                                              //                          .write
		.av_writedata           (clock_cross_kernel_mem1_m0_writedata),                                          //                          .writedata
		.av_debugaccess         (clock_cross_kernel_mem1_m0_debugaccess),                                        //                          .debugaccess
		.av_beginbursttransfer  (1'b0),                                                                          //               (terminated)
		.av_begintransfer       (1'b0),                                                                          //               (terminated)
		.av_chipselect          (1'b0),                                                                          //               (terminated)
		.av_lock                (1'b0),                                                                          //               (terminated)
		.uav_clken              (),                                                                              //               (terminated)
		.av_clken               (1'b1),                                                                          //               (terminated)
		.uav_response           (2'b00),                                                                         //               (terminated)
		.av_response            (),                                                                              //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                          //               (terminated)
		.av_writeresponsevalid  ()                                                                               //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (25),
		.AV_DATA_W                      (256),
		.UAV_DATA_W                     (256),
		.AV_BURSTCOUNT_W                (5),
		.AV_BYTEENABLE_W                (32),
		.UAV_BYTEENABLE_W               (32),
		.UAV_ADDRESS_W                  (30),
		.UAV_BURSTCOUNT_W               (10),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (1),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (32),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) address_span_extender_kernel_windowed_slave_translator (
		.clk                    (pll_outclk0_clk),                                                               //                      clk.clk
		.reset                  (clock_cross_kernel_mem1_m0_reset_reset_bridge_in_reset_reset),                  //                    reset.reset
		.uav_address            (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (clock_cross_kernel_mem1_m0_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (address_span_extender_kernel_windowed_slave_address),                           //      avalon_anti_slave_0.address
		.av_write               (address_span_extender_kernel_windowed_slave_write),                             //                         .write
		.av_read                (address_span_extender_kernel_windowed_slave_read),                              //                         .read
		.av_readdata            (address_span_extender_kernel_windowed_slave_readdata),                          //                         .readdata
		.av_writedata           (address_span_extender_kernel_windowed_slave_writedata),                         //                         .writedata
		.av_burstcount          (address_span_extender_kernel_windowed_slave_burstcount),                        //                         .burstcount
		.av_byteenable          (address_span_extender_kernel_windowed_slave_byteenable),                        //                         .byteenable
		.av_readdatavalid       (address_span_extender_kernel_windowed_slave_readdatavalid),                     //                         .readdatavalid
		.av_waitrequest         (address_span_extender_kernel_windowed_slave_waitrequest),                       //                         .waitrequest
		.av_begintransfer       (),                                                                              //              (terminated)
		.av_beginbursttransfer  (),                                                                              //              (terminated)
		.av_writebyteenable     (),                                                                              //              (terminated)
		.av_lock                (),                                                                              //              (terminated)
		.av_chipselect          (),                                                                              //              (terminated)
		.av_clken               (),                                                                              //              (terminated)
		.uav_clken              (1'b0),                                                                          //              (terminated)
		.av_debugaccess         (),                                                                              //              (terminated)
		.av_outputenable        (),                                                                              //              (terminated)
		.uav_response           (),                                                                              //              (terminated)
		.av_response            (2'b00),                                                                         //              (terminated)
		.uav_writeresponsevalid (),                                                                              //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                           //              (terminated)
	);

endmodule
