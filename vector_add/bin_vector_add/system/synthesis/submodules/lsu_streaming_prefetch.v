
/*****************************************************************************/
// Streaming prefetch read unit:
//   Pre-fetch a stream of data words beginning at i_address.  The
//   FIFO is kept full until a non-contiguous address is encountered, at
//   which time the FIFO is either fully or partially drained.
//   On a NOP, garbage data is returned and the thread passes through the unit.
/*****************************************************************************/
module lsu_streaming_prefetch_read 
(
   clk, reset, o_stall, i_valid, i_address, i_stall, i_nop, o_valid, o_readdata, 
   o_active, //Debugging signal
   avm_address, avm_burstcount, avm_read, 
   avm_readdata, avm_waitrequest, avm_byteenable, avm_readdatavalid
);

/*************
* Parameters *
*************/
parameter AWIDTH=32;
parameter WIDTH_BYTES=32;
parameter MWIDTH_BYTES=32;
parameter ALIGNMENT_ABITS=6;
parameter BURSTCOUNT_WIDTH=6;
parameter KERNEL_SIDE_MEM_LATENCY=1;
parameter MEMORY_SIDE_MEM_LATENCY=1;
parameter NUM_WORDS_PER_READ=32; //memory words
parameter NUM_BYTES_PER_READ=NUM_WORDS_PER_READ*MWIDTH_BYTES;

// Derived parameters
localparam WIDTH=8*WIDTH_BYTES;
localparam MWIDTH=8*MWIDTH_BYTES;
localparam MBYTE_SELECT_BITS=$clog2(MWIDTH_BYTES);
localparam BYTE_SELECT_BITS=$clog2(WIDTH_BYTES);
localparam MAXBURSTCOUNT=2**(BURSTCOUNT_WIDTH-1);
// Parameterize the FIFO depth based on the "drain" rate of the return FIFO
//   In the worst case you need memory latency + burstcount, but if the kernel
//   is slow to pull data out we can overlap the next burst with that.  Also
//   since you can't backpressure responses, you need at least a full burst
//   of space.
// Note the burst_read_master requires a fifo depth >= MAXBURSTCOUNT + 5.  This
// hardcoded 5 latency could result in half the bandwidth when burst and
// latency is small, hence double it so we can double buffer.
localparam _FIFO_DEPTH = MAXBURSTCOUNT + 10 + ((MEMORY_SIDE_MEM_LATENCY * WIDTH_BYTES + MWIDTH_BYTES - 1) / MWIDTH_BYTES) + NUM_WORDS_PER_READ; //adding number of words per read here to allow for at least one read burst before fifo_af
// This fifo doesn't affect the pipeline, round to power of 2
localparam FIFO_DEPTH = 2**$clog2(_FIFO_DEPTH);

localparam FIFO_DEPTH_LOG2=$clog2(FIFO_DEPTH);

localparam FIFO_DEPTH_USER = FIFO_DEPTH*(MWIDTH/WIDTH);
localparam FIFO_DEPTH_USER_LOG2=$clog2(FIFO_DEPTH_USER);

// FIFO caching in user words
localparam FIFO_FULL_THRESHOLD = (FIFO_DEPTH - NUM_WORDS_PER_READ) * (MWIDTH/WIDTH);

/********
* Ports *
********/
// Standard globals
input clk;
input reset;

// Upstream pipeline interface
output o_stall;
input i_valid;
input i_nop;
input [AWIDTH-1:0] i_address;

// Downstream pipeline interface
input i_stall;
output o_valid;
output [WIDTH-1:0] o_readdata;
output o_active;

// Avalon interface
output [AWIDTH-1:0] avm_address;
output [BURSTCOUNT_WIDTH-1:0] avm_burstcount;
output avm_read;
input [MWIDTH-1:0] avm_readdata;
input avm_waitrequest;
output [MWIDTH_BYTES-1:0] avm_byteenable;
input avm_readdatavalid;

// FIFO Isolation to outside world
wire f_avm_read;
wire f_avm_waitrequest;
wire [AWIDTH-1:0] f_avm_address;
wire [BURSTCOUNT_WIDTH-1:0] f_avm_burstcount;

acl_data_fifo #(
  .DATA_WIDTH(AWIDTH+BURSTCOUNT_WIDTH),
  .DEPTH(2),
  .IMPL("ll_reg")
) avm_buffer (
  .clock(clk),
  .resetn(!reset),
  .data_in( {f_avm_address,f_avm_burstcount} ),
  .valid_in( f_avm_read ),
  .data_out( {avm_address,avm_burstcount} ),
  .valid_out( avm_read ),
  .stall_in( avm_waitrequest ),
  .stall_out( f_avm_waitrequest )
);

/***************
* Architecture *
***************/

// Input Pipeline Signals
reg              i_valid_r;
reg [AWIDTH-1:0] i_address_r;
reg              i_nop_r;

reg              i_valid_rr;
reg [AWIDTH-1:0] i_address_rr;
reg              i_nop_rr;

reg input_command_is_read;
reg input_command_is_nop;
wire input_address_is_seq;

reg stall_r;

// Counter Signals
reg [FIFO_DEPTH_USER_LOG2:0] drain_cnt;
wire load_drain_cnt;
wire dec_drain_cnt;
wire done_drain;

// Current Command Memory Accesses
wire fifo_af;
wire rm_go;
wire [AWIDTH-1:0] rm_base_address;
wire rm_ack;
wire rm_ack_user;
wire rm_done;
wire rm_done_early;
reg rm_done_early_r;
wire rm_valid;
wire [MWIDTH-1:0] rm_data;

// FIFO Tracking;
reg  [FIFO_DEPTH_USER_LOG2:0] num_words_in_fifo; //extra bit to prevent overflow
wire [FIFO_DEPTH_USER_LOG2:0] num_words_to_drain;
wire [FIFO_DEPTH_USER_LOG2:0] fifo_cnt_inc;
wire [FIFO_DEPTH_USER_LOG2:0] fifo_cnt_dec;

// Addressing
wire next_address_before_current;
reg  next_address_after_last;
wire next_address_is_in_fifo;
wire load_next_base_address;
wire [AWIDTH-1:0] next_base_address;
reg [AWIDTH-1:0] next_rm_base_address;
reg next_base_address_vld;
reg [AWIDTH:0] address_offset;

/**********************************************************/
// Input Pipeline
/**********************************************************/
always@(posedge clk or posedge reset) begin
	if (reset) begin
		i_valid_r          <= 1'b0;
		i_address_r        <= 'x;
		i_nop_r            <= 'x;
		i_valid_rr         <= 1'b0;
		i_address_rr       <= 'x;
		i_nop_rr           <= 'x;
	end else begin
		if (!o_stall) begin
			//stage 1 input registers
			i_nop_r     <= i_nop;
			i_valid_r   <= i_valid;
			// Force address alignment bits to 0.  They should already be 0, but forcing
			// them to 0 here lets Quartus see the alignment and optimize the design
			i_address_r <= ((i_address >> ALIGNMENT_ABITS) << ALIGNMENT_ABITS);

			//stage 2 input registers
			i_nop_rr     <= i_nop_r;
			i_valid_rr   <= i_valid_r;
			i_address_rr <= (i_valid_r & !i_nop_r) ? i_address_r : i_address_rr;
		end

	end
end

/**********************************************************/
// Computed input flags
/**********************************************************/
always@(posedge clk or posedge reset) begin
	if (reset) begin
		input_command_is_read   <= 1'b0;
		input_command_is_nop    <= 1'b0;
		address_offset          <= 'x;
		next_address_after_last <= 'x;

		stall_r <= 1'b0;
		rm_done_early_r <= 1'b0;
	end else begin
		if (!o_stall) begin
			input_command_is_read <= i_valid_r & !i_nop_r;
			input_command_is_nop  <= i_valid_r & i_nop_r;

			address_offset <= {1'b0, i_address_r} - ({1'b0, i_address_rr} + (1 << ALIGNMENT_ABITS));
			next_address_after_last <= (i_address_r >= (next_rm_base_address + fifo_cnt_inc));
		end

		stall_r <= o_stall;

		rm_done_early_r <= rm_done_early & ~rm_done_early_r; //remove done early from critical path, not a big deal if we add a clock cycle here - also need to ensure not active for two cycles in a row in case it goes low
	end
end

assign input_address_is_seq  = (address_offset == 0) & next_base_address_vld;


assign o_stall = i_valid_rr & !o_valid; //stall if the input register is valid and we can't output the data addressed


/**********************************************************/
// Process Current Command Counters
/**********************************************************/
// Drain Count
//    Number of user words to be removed from FIFO before next read is valid
assign load_drain_cnt = input_command_is_read & !input_address_is_seq & !stall_r;
assign done_drain = (drain_cnt == 0);
assign dec_drain_cnt  = !done_drain & rm_valid;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		drain_cnt      <= 0;
	end else begin
		if (load_drain_cnt) begin
			drain_cnt <= num_words_to_drain - rm_valid;
		end else begin
			drain_cnt <= drain_cnt - dec_drain_cnt;
		end
	end
end


/**********************************************************/
// Process Current Command Memory Accesses
/**********************************************************/

assign fifo_af = (num_words_in_fifo >= FIFO_FULL_THRESHOLD);
assign rm_go = ~fifo_af & rm_done_early_r & next_base_address_vld;
assign rm_base_address = (load_next_base_address & !stall_r) ? next_base_address : next_rm_base_address;
assign rm_ack_user = ((!done_drain | load_drain_cnt) | (input_command_is_read & !i_stall)) & rm_valid;
assign o_valid = ((input_command_is_read & done_drain & !load_drain_cnt & rm_valid) | input_command_is_nop) & !i_stall;

lsu_burst_read_master #(
   .DATAWIDTH( MWIDTH ),
   .MAXBURSTCOUNT( MAXBURSTCOUNT ),
   .BURSTCOUNTWIDTH( BURSTCOUNT_WIDTH ),
   .BYTEENABLEWIDTH( MWIDTH_BYTES ),
   .ADDRESSWIDTH( AWIDTH ),
   .FIFODEPTH( FIFO_DEPTH ),
   .FIFODEPTH_LOG2( FIFO_DEPTH_LOG2 ),
   .FIFOUSEMEMORY( 1 )
) read_master (
   .clk(clk),
   .reset(reset),
   .o_active(o_active),

   .control_fixed_location( 1'b0 ),
   .control_read_base( rm_base_address ),
   .control_read_length( NUM_BYTES_PER_READ ),
   .control_go( rm_go ),
   .control_done( rm_done ),
   .control_early_done(rm_done_early),

   .user_read_buffer( rm_ack),
   .user_buffer_data( rm_data ),
   .user_data_available( rm_valid ),

   .master_address( f_avm_address ),
   .master_read( f_avm_read ),
   .master_byteenable( avm_byteenable ),
   .master_readdata( avm_readdata ),
   .master_readdatavalid( avm_readdatavalid ),
   .master_burstcount( f_avm_burstcount ),
   .master_waitrequest( f_avm_waitrequest )
);

// Handle different user/memory word sizes
// TODO: draining currently done at user word alignment
//          - could be more efficient if done at memory word alignment, but logic is more complex and may hurt fmax
generate
	if(MBYTE_SELECT_BITS != BYTE_SELECT_BITS) begin
		// Width adapting signals
		reg [MBYTE_SELECT_BITS-BYTE_SELECT_BITS-1:0] wa_word_counter;
		
		// Width adapting logic - a counter is used to track which word is active from
		// each MWIDTH sized line from main memory.  The counter is initialized from 
		// the lower address bits of the initial request.
		always@(posedge clk or posedge reset)
		begin
			if (reset == 1'b1) begin
				wa_word_counter <= 0;
			end else begin
				wa_word_counter <= ((drain_cnt == 1) | (num_words_in_fifo == 0)) ? i_address_rr[MBYTE_SELECT_BITS-1:BYTE_SELECT_BITS] : (wa_word_counter + rm_ack_user);
			end
		end
		assign rm_ack = (&wa_word_counter) & rm_ack_user;
		assign o_readdata = rm_data[wa_word_counter * WIDTH +: WIDTH];
	end else begin
		// Widths are matched, every request is a new memory word
		assign rm_ack = rm_ack_user;
		assign o_readdata = rm_data;
	end
endgenerate

//FIFO Memory Word Count
//    in user words
always @(posedge clk or posedge reset) begin
	if (reset) begin
		num_words_in_fifo <= 0;
	end else begin
		num_words_in_fifo <= num_words_in_fifo - fifo_cnt_dec + fifo_cnt_inc;
	end
end
assign fifo_cnt_inc = (rm_go  ? (NUM_WORDS_PER_READ*(MWIDTH/WIDTH)) : 0);
assign fifo_cnt_dec = (rm_ack ? (MWIDTH/WIDTH) : 0);

assign num_words_to_drain = input_command_is_read ? (next_address_is_in_fifo ? (address_offset[AWIDTH-1:0] >> ALIGNMENT_ABITS) :  num_words_in_fifo) : 0;

//Addressing
//Assuming ALIGNMENT_ABITS == BYTE_SELECT_BITS
assign next_address_before_current = address_offset[AWIDTH]; //overflow of difference means i_address_r < current_address
assign next_address_is_in_fifo = ~next_address_before_current & ~next_address_after_last;
assign load_next_base_address = !next_address_is_in_fifo & input_command_is_read;

// Compute the last address to burst from.  In this case, alignment is not
// for Quartus optimization but to properly compute the MWIDTH sized burst.
assign next_base_address = ((i_address_rr >> MBYTE_SELECT_BITS) << MBYTE_SELECT_BITS);

always @(posedge clk or posedge reset) begin
	if (reset) begin
		next_rm_base_address  <= 0;
		next_base_address_vld <= 1'b0;
	end else begin
		//next base address
		if (load_next_base_address & !stall_r) begin
			next_rm_base_address <= next_base_address;
		end else if (rm_go) begin
			next_rm_base_address <= next_rm_base_address + (NUM_WORDS_PER_READ << MBYTE_SELECT_BITS);
		end
		next_base_address_vld <= next_base_address_vld | input_command_is_read;

	end
end

endmodule

