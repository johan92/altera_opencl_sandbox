// (C) 1992-2015 Altera Corporation. All rights reserved.                         
// Your use of Altera Corporation's design tools, logic functions and other       
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Altera MegaCore Function License Agreement, or other applicable     
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Altera and sold by   
// Altera or its authorized distributors.  Please refer to the applicable         
// agreement for further details.                                                 
    

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vector_add_basic_block_0
	(
		input 		clock,
		input 		resetn,
		input [63:0] 		input_x,
		input [31:0] 		input_global_size_0,
		input [63:0] 		input_y,
		input [63:0] 		input_z,
		input 		valid_in,
		output 		stall_out,
		input [31:0] 		input_global_id_0,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		input 		start,
		output 		avm_local_bb0_ld__enable,
		input [255:0] 		avm_local_bb0_ld__readdata,
		input 		avm_local_bb0_ld__readdatavalid,
		input 		avm_local_bb0_ld__waitrequest,
		output [29:0] 		avm_local_bb0_ld__address,
		output 		avm_local_bb0_ld__read,
		output 		avm_local_bb0_ld__write,
		input 		avm_local_bb0_ld__writeack,
		output [255:0] 		avm_local_bb0_ld__writedata,
		output [31:0] 		avm_local_bb0_ld__byteenable,
		output [4:0] 		avm_local_bb0_ld__burstcount,
		output 		profile_lsu_local_bb0_ld__profile_bw_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__profile_bw_incr,
		output 		profile_lsu_local_bb0_ld__profile_total_ivalid_cntl,
		output 		profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl,
		output 		profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr,
		output 		profile_lsu_local_bb0_ld__profile_avm_stall_cntl,
		output 		local_bb0_ld__active,
		input 		clock2x,
		output 		avm_local_bb0_ld__u0_enable,
		input [255:0] 		avm_local_bb0_ld__u0_readdata,
		input 		avm_local_bb0_ld__u0_readdatavalid,
		input 		avm_local_bb0_ld__u0_waitrequest,
		output [29:0] 		avm_local_bb0_ld__u0_address,
		output 		avm_local_bb0_ld__u0_read,
		output 		avm_local_bb0_ld__u0_write,
		input 		avm_local_bb0_ld__u0_writeack,
		output [255:0] 		avm_local_bb0_ld__u0_writedata,
		output [31:0] 		avm_local_bb0_ld__u0_byteenable,
		output [4:0] 		avm_local_bb0_ld__u0_burstcount,
		output 		profile_lsu_local_bb0_ld__u0_profile_bw_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__u0_profile_bw_incr,
		output 		profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl,
		output 		profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl,
		output 		profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr,
		output 		profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl,
		output 		local_bb0_ld__u0_active,
		output 		avm_local_bb0_st_add_enable,
		input [255:0] 		avm_local_bb0_st_add_readdata,
		input 		avm_local_bb0_st_add_readdatavalid,
		input 		avm_local_bb0_st_add_waitrequest,
		output [29:0] 		avm_local_bb0_st_add_address,
		output 		avm_local_bb0_st_add_read,
		output 		avm_local_bb0_st_add_write,
		input 		avm_local_bb0_st_add_writeack,
		output [255:0] 		avm_local_bb0_st_add_writedata,
		output [31:0] 		avm_local_bb0_st_add_byteenable,
		output [4:0] 		avm_local_bb0_st_add_burstcount,
		output 		profile_lsu_local_bb0_st_add_profile_bw_cntl,
		output [31:0] 		profile_lsu_local_bb0_st_add_profile_bw_incr,
		output 		profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl,
		output 		profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl,
		output 		profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl,
		output [31:0] 		profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr,
		output 		profile_lsu_local_bb0_st_add_profile_avm_stall_cntl,
		output 		local_bb0_st_add_active
	);


// Values used for debugging.  These are swept away by synthesis.
wire _entry;
wire _exit;
 reg [31:0] _num_entry_NO_SHIFT_REG;
 reg [31:0] _num_exit_NO_SHIFT_REG;
wire [31:0] _num_live;

assign _entry = ((&valid_in) & ~((|stall_out)));
assign _exit = ((&valid_out) & ~((|stall_in)));
assign _num_live = (_num_entry_NO_SHIFT_REG - _num_exit_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		_num_entry_NO_SHIFT_REG <= 32'h0;
		_num_exit_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		if (_entry)
		begin
			_num_entry_NO_SHIFT_REG <= (_num_entry_NO_SHIFT_REG + 2'h1);
		end
		if (_exit)
		begin
			_num_exit_NO_SHIFT_REG <= (_num_exit_NO_SHIFT_REG + 2'h1);
		end
	end
end



// This section defines the behaviour of the MERGE node
wire merge_node_stall_in;
 reg merge_node_valid_out_NO_SHIFT_REG;
wire merge_stalled_by_successors;
 reg merge_block_selector_NO_SHIFT_REG;
 reg merge_node_valid_in_staging_reg_NO_SHIFT_REG;
 reg [31:0] input_global_id_0_staging_reg_NO_SHIFT_REG;
 reg [31:0] local_lvm_input_global_id_0_NO_SHIFT_REG;
 reg is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
 reg invariant_valid_NO_SHIFT_REG;

assign merge_stalled_by_successors = (|(merge_node_stall_in & merge_node_valid_out_NO_SHIFT_REG));
assign stall_out = merge_node_valid_in_staging_reg_NO_SHIFT_REG;

always @(*)
begin
	if ((merge_node_valid_in_staging_reg_NO_SHIFT_REG | valid_in))
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b1;
	end
	else
	begin
		merge_block_selector_NO_SHIFT_REG = 1'b0;
		is_merge_data_to_local_regs_valid_NO_SHIFT_REG = 1'b0;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		input_global_id_0_staging_reg_NO_SHIFT_REG <= 'x;
		merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (((merge_block_selector_NO_SHIFT_REG != 1'b0) | merge_stalled_by_successors))
		begin
			if (~(merge_node_valid_in_staging_reg_NO_SHIFT_REG))
			begin
				input_global_id_0_staging_reg_NO_SHIFT_REG <= input_global_id_0;
				merge_node_valid_in_staging_reg_NO_SHIFT_REG <= valid_in;
			end
		end
		else
		begin
			merge_node_valid_in_staging_reg_NO_SHIFT_REG <= 1'b0;
		end
	end
end

always @(posedge clock)
begin
	if (~(merge_stalled_by_successors))
	begin
		case (merge_block_selector_NO_SHIFT_REG)
			1'b0:
			begin
				if (merge_node_valid_in_staging_reg_NO_SHIFT_REG)
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0_staging_reg_NO_SHIFT_REG;
				end
				else
				begin
					local_lvm_input_global_id_0_NO_SHIFT_REG <= input_global_id_0;
				end
			end

			default:
			begin
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		merge_node_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (~(merge_stalled_by_successors))
		begin
			merge_node_valid_out_NO_SHIFT_REG <= is_merge_data_to_local_regs_valid_NO_SHIFT_REG;
		end
		else
		begin
			if (~(merge_node_stall_in))
			begin
				merge_node_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		invariant_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		invariant_valid_NO_SHIFT_REG <= (~(start) & (invariant_valid_NO_SHIFT_REG | is_merge_data_to_local_regs_valid_NO_SHIFT_REG));
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_idxprom_stall_local;
wire [63:0] local_bb0_idxprom;

assign local_bb0_idxprom[32] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[33] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[34] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[35] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[36] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[37] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[38] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[39] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[40] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[41] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[42] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[43] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[44] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[45] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[46] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[47] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[48] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[49] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[50] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[51] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[52] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[53] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[54] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[55] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[56] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[57] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[58] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[59] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[60] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[61] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[62] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[63] = local_lvm_input_global_id_0_NO_SHIFT_REG[31];
assign local_bb0_idxprom[31:0] = local_lvm_input_global_id_0_NO_SHIFT_REG;

// This section implements an unregistered operation.
// 
wire local_bb0_arrayidx_stall_local;
wire [63:0] local_bb0_arrayidx;

assign local_bb0_arrayidx = ((input_x & 64'hFFFFFFFFFFFFFC00) + (local_bb0_idxprom << 6'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_arrayidx2_stall_local;
wire [63:0] local_bb0_arrayidx2;

assign local_bb0_arrayidx2 = ((input_y & 64'hFFFFFFFFFFFFFC00) + (local_bb0_idxprom << 6'h2));

// This section implements an unregistered operation.
// 
wire local_bb0_arrayidx_valid_out;
wire local_bb0_arrayidx_stall_in;
wire local_bb0_arrayidx2_valid_out;
wire local_bb0_arrayidx2_stall_in;
wire local_bb0_arrayidx4_valid_out;
wire local_bb0_arrayidx4_stall_in;
wire local_bb0_arrayidx4_inputs_ready;
wire local_bb0_arrayidx4_stall_local;
wire [63:0] local_bb0_arrayidx4;
 reg local_bb0_arrayidx_consumed_0_NO_SHIFT_REG;
 reg local_bb0_arrayidx2_consumed_0_NO_SHIFT_REG;
 reg local_bb0_arrayidx4_consumed_0_NO_SHIFT_REG;

assign local_bb0_arrayidx4_inputs_ready = merge_node_valid_out_NO_SHIFT_REG;
assign local_bb0_arrayidx4 = ((input_z & 64'hFFFFFFFFFFFFFC00) + (local_bb0_idxprom << 6'h2));
assign local_bb0_arrayidx4_stall_local = ((local_bb0_arrayidx_stall_in & ~(local_bb0_arrayidx_consumed_0_NO_SHIFT_REG)) | (local_bb0_arrayidx2_stall_in & ~(local_bb0_arrayidx2_consumed_0_NO_SHIFT_REG)) | (local_bb0_arrayidx4_stall_in & ~(local_bb0_arrayidx4_consumed_0_NO_SHIFT_REG)));
assign local_bb0_arrayidx_valid_out = (local_bb0_arrayidx4_inputs_ready & ~(local_bb0_arrayidx_consumed_0_NO_SHIFT_REG));
assign local_bb0_arrayidx2_valid_out = (local_bb0_arrayidx4_inputs_ready & ~(local_bb0_arrayidx2_consumed_0_NO_SHIFT_REG));
assign local_bb0_arrayidx4_valid_out = (local_bb0_arrayidx4_inputs_ready & ~(local_bb0_arrayidx4_consumed_0_NO_SHIFT_REG));
assign merge_node_stall_in = (|local_bb0_arrayidx4_stall_local);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_arrayidx_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_arrayidx2_consumed_0_NO_SHIFT_REG <= 1'b0;
		local_bb0_arrayidx4_consumed_0_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		local_bb0_arrayidx_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx4_inputs_ready & (local_bb0_arrayidx_consumed_0_NO_SHIFT_REG | ~(local_bb0_arrayidx_stall_in)) & local_bb0_arrayidx4_stall_local);
		local_bb0_arrayidx2_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx4_inputs_ready & (local_bb0_arrayidx2_consumed_0_NO_SHIFT_REG | ~(local_bb0_arrayidx2_stall_in)) & local_bb0_arrayidx4_stall_local);
		local_bb0_arrayidx4_consumed_0_NO_SHIFT_REG <= (local_bb0_arrayidx4_inputs_ready & (local_bb0_arrayidx4_consumed_0_NO_SHIFT_REG | ~(local_bb0_arrayidx4_stall_in)) & local_bb0_arrayidx4_stall_local);
	end
end


// This section implements a staging register.
// 
wire rstag_1to1_bb0_arrayidx_valid_out;
wire rstag_1to1_bb0_arrayidx_stall_in;
wire rstag_1to1_bb0_arrayidx_inputs_ready;
wire rstag_1to1_bb0_arrayidx_stall_local;
 reg rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG;
wire rstag_1to1_bb0_arrayidx_combined_valid;
 reg [63:0] rstag_1to1_bb0_arrayidx_staging_reg_NO_SHIFT_REG;
wire [63:0] rstag_1to1_bb0_arrayidx;

assign rstag_1to1_bb0_arrayidx_inputs_ready = local_bb0_arrayidx_valid_out;
assign rstag_1to1_bb0_arrayidx = (rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG ? rstag_1to1_bb0_arrayidx_staging_reg_NO_SHIFT_REG : (local_bb0_arrayidx & 64'hFFFFFFFFFFFFFFFC));
assign rstag_1to1_bb0_arrayidx_combined_valid = (rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG | rstag_1to1_bb0_arrayidx_inputs_ready);
assign rstag_1to1_bb0_arrayidx_valid_out = rstag_1to1_bb0_arrayidx_combined_valid;
assign rstag_1to1_bb0_arrayidx_stall_local = rstag_1to1_bb0_arrayidx_stall_in;
assign local_bb0_arrayidx_stall_in = (|rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_1to1_bb0_arrayidx_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_1to1_bb0_arrayidx_stall_local)
		begin
			if (~(rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG))
			begin
				rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG <= rstag_1to1_bb0_arrayidx_inputs_ready;
			end
		end
		else
		begin
			rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_1to1_bb0_arrayidx_staging_valid_NO_SHIFT_REG))
		begin
			rstag_1to1_bb0_arrayidx_staging_reg_NO_SHIFT_REG <= (local_bb0_arrayidx & 64'hFFFFFFFFFFFFFFFC);
		end
	end
end


// This section implements a staging register.
// 
wire rstag_1to1_bb0_arrayidx2_valid_out;
wire rstag_1to1_bb0_arrayidx2_stall_in;
wire rstag_1to1_bb0_arrayidx2_inputs_ready;
wire rstag_1to1_bb0_arrayidx2_stall_local;
 reg rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG;
wire rstag_1to1_bb0_arrayidx2_combined_valid;
 reg [63:0] rstag_1to1_bb0_arrayidx2_staging_reg_NO_SHIFT_REG;
wire [63:0] rstag_1to1_bb0_arrayidx2;

assign rstag_1to1_bb0_arrayidx2_inputs_ready = local_bb0_arrayidx2_valid_out;
assign rstag_1to1_bb0_arrayidx2 = (rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG ? rstag_1to1_bb0_arrayidx2_staging_reg_NO_SHIFT_REG : (local_bb0_arrayidx2 & 64'hFFFFFFFFFFFFFFFC));
assign rstag_1to1_bb0_arrayidx2_combined_valid = (rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG | rstag_1to1_bb0_arrayidx2_inputs_ready);
assign rstag_1to1_bb0_arrayidx2_valid_out = rstag_1to1_bb0_arrayidx2_combined_valid;
assign rstag_1to1_bb0_arrayidx2_stall_local = rstag_1to1_bb0_arrayidx2_stall_in;
assign local_bb0_arrayidx2_stall_in = (|rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_1to1_bb0_arrayidx2_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_1to1_bb0_arrayidx2_stall_local)
		begin
			if (~(rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG))
			begin
				rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG <= rstag_1to1_bb0_arrayidx2_inputs_ready;
			end
		end
		else
		begin
			rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_1to1_bb0_arrayidx2_staging_valid_NO_SHIFT_REG))
		begin
			rstag_1to1_bb0_arrayidx2_staging_reg_NO_SHIFT_REG <= (local_bb0_arrayidx2 & 64'hFFFFFFFFFFFFFFFC);
		end
	end
end


// Register node:
//  * latency = 2
//  * capacity = 2
 logic rnode_1to3_bb0_arrayidx4_0_valid_out_NO_SHIFT_REG;
 logic rnode_1to3_bb0_arrayidx4_0_stall_in_NO_SHIFT_REG;
 logic [63:0] rnode_1to3_bb0_arrayidx4_0_NO_SHIFT_REG;
 logic rnode_1to3_bb0_arrayidx4_0_reg_3_inputs_ready_NO_SHIFT_REG;
 logic [63:0] rnode_1to3_bb0_arrayidx4_0_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_bb0_arrayidx4_0_valid_out_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_bb0_arrayidx4_0_stall_in_reg_3_NO_SHIFT_REG;
 logic rnode_1to3_bb0_arrayidx4_0_stall_out_reg_3_NO_SHIFT_REG;

acl_data_fifo rnode_1to3_bb0_arrayidx4_0_reg_3_fifo (
	.clock(clock),
	.resetn(resetn),
	.valid_in(rnode_1to3_bb0_arrayidx4_0_reg_3_inputs_ready_NO_SHIFT_REG),
	.stall_in(rnode_1to3_bb0_arrayidx4_0_stall_in_reg_3_NO_SHIFT_REG),
	.valid_out(rnode_1to3_bb0_arrayidx4_0_valid_out_reg_3_NO_SHIFT_REG),
	.stall_out(rnode_1to3_bb0_arrayidx4_0_stall_out_reg_3_NO_SHIFT_REG),
	.data_in((local_bb0_arrayidx4 & 64'hFFFFFFFFFFFFFFFC)),
	.data_out(rnode_1to3_bb0_arrayidx4_0_reg_3_NO_SHIFT_REG)
);

defparam rnode_1to3_bb0_arrayidx4_0_reg_3_fifo.DEPTH = 3;
defparam rnode_1to3_bb0_arrayidx4_0_reg_3_fifo.DATA_WIDTH = 64;
defparam rnode_1to3_bb0_arrayidx4_0_reg_3_fifo.ALLOW_FULL_WRITE = 0;
defparam rnode_1to3_bb0_arrayidx4_0_reg_3_fifo.IMPL = "ll_reg";

assign rnode_1to3_bb0_arrayidx4_0_reg_3_inputs_ready_NO_SHIFT_REG = local_bb0_arrayidx4_valid_out;
assign local_bb0_arrayidx4_stall_in = rnode_1to3_bb0_arrayidx4_0_stall_out_reg_3_NO_SHIFT_REG;
assign rnode_1to3_bb0_arrayidx4_0_NO_SHIFT_REG = rnode_1to3_bb0_arrayidx4_0_reg_3_NO_SHIFT_REG;
assign rnode_1to3_bb0_arrayidx4_0_stall_in_reg_3_NO_SHIFT_REG = rnode_1to3_bb0_arrayidx4_0_stall_in_NO_SHIFT_REG;
assign rnode_1to3_bb0_arrayidx4_0_valid_out_NO_SHIFT_REG = rnode_1to3_bb0_arrayidx4_0_valid_out_reg_3_NO_SHIFT_REG;

// This section implements a registered operation.
// 
wire local_bb0_ld__inputs_ready;
 reg local_bb0_ld__valid_out_NO_SHIFT_REG;
wire local_bb0_ld__stall_in;
wire local_bb0_ld__output_regs_ready;
wire local_bb0_ld__fu_stall_out;
wire local_bb0_ld__fu_valid_out;
wire [31:0] local_bb0_ld__lsu_dataout;
 reg [31:0] local_bb0_ld__NO_SHIFT_REG;
wire local_bb0_ld__causedstall;

lsu_top lsu_local_bb0_ld_ (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr((rstag_1to1_bb0_arrayidx & 64'hFFFFFFFFFFFFFFFC)),
	.stream_size(input_global_size_0),
	.stream_reset(valid_in),
	.o_stall(local_bb0_ld__fu_stall_out),
	.i_valid(local_bb0_ld__inputs_ready),
	.i_address((rstag_1to1_bb0_arrayidx & 64'hFFFFFFFFFFFFFFFC)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(1'b0),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_ld__output_regs_ready)),
	.o_valid(local_bb0_ld__fu_valid_out),
	.o_readdata(local_bb0_ld__lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_ld__active),
	.avm_address(avm_local_bb0_ld__address),
	.avm_read(avm_local_bb0_ld__read),
	.avm_enable(avm_local_bb0_ld__enable),
	.avm_readdata(avm_local_bb0_ld__readdata),
	.avm_write(avm_local_bb0_ld__write),
	.avm_writeack(avm_local_bb0_ld__writeack),
	.avm_burstcount(avm_local_bb0_ld__burstcount),
	.avm_writedata(avm_local_bb0_ld__writedata),
	.avm_byteenable(avm_local_bb0_ld__byteenable),
	.avm_waitrequest(avm_local_bb0_ld__waitrequest),
	.avm_readdatavalid(avm_local_bb0_ld__readdatavalid),
	.profile_bw(profile_lsu_local_bb0_ld__profile_bw_cntl),
	.profile_bw_incr(profile_lsu_local_bb0_ld__profile_bw_incr),
	.profile_total_ivalid(profile_lsu_local_bb0_ld__profile_total_ivalid_cntl),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl),
	.profile_avm_burstcount_total(profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl),
	.profile_avm_burstcount_total_incr(profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall(profile_lsu_local_bb0_ld__profile_avm_stall_cntl)
);

defparam lsu_local_bb0_ld_.AWIDTH = 30;
defparam lsu_local_bb0_ld_.WIDTH_BYTES = 4;
defparam lsu_local_bb0_ld_.MWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld_.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld_.ALIGNMENT_BYTES = 4;
defparam lsu_local_bb0_ld_.READ = 1;
defparam lsu_local_bb0_ld_.ATOMIC = 0;
defparam lsu_local_bb0_ld_.WIDTH = 32;
defparam lsu_local_bb0_ld_.MWIDTH = 256;
defparam lsu_local_bb0_ld_.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_ld_.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_ld_.KERNEL_SIDE_MEM_LATENCY = 2;
defparam lsu_local_bb0_ld_.MEMORY_SIDE_MEM_LATENCY = 89;
defparam lsu_local_bb0_ld_.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_ld_.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_ld_.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_ld_.NUMBER_BANKS = 1;
defparam lsu_local_bb0_ld_.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_ld_.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb0_ld_.USEINPUTFIFO = 0;
defparam lsu_local_bb0_ld_.USECACHING = 0;
defparam lsu_local_bb0_ld_.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_ld_.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_ld_.ACL_PROFILE = 1;
defparam lsu_local_bb0_ld_.ACL_PROFILE_INCREMENT_WIDTH = 32;
defparam lsu_local_bb0_ld_.ADDRSPACE = 1;
defparam lsu_local_bb0_ld_.STYLE = "STREAMING";

assign local_bb0_ld__inputs_ready = rstag_1to1_bb0_arrayidx_valid_out;
assign local_bb0_ld__output_regs_ready = (&(~(local_bb0_ld__valid_out_NO_SHIFT_REG) | ~(local_bb0_ld__stall_in)));
assign rstag_1to1_bb0_arrayidx_stall_in = (local_bb0_ld__fu_stall_out | ~(local_bb0_ld__inputs_ready));
assign local_bb0_ld__causedstall = (local_bb0_ld__inputs_ready && (local_bb0_ld__fu_stall_out && !(~(local_bb0_ld__output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld__NO_SHIFT_REG <= 'x;
		local_bb0_ld__valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_ld__output_regs_ready)
		begin
			local_bb0_ld__NO_SHIFT_REG <= local_bb0_ld__lsu_dataout;
			local_bb0_ld__valid_out_NO_SHIFT_REG <= local_bb0_ld__fu_valid_out;
		end
		else
		begin
			if (~(local_bb0_ld__stall_in))
			begin
				local_bb0_ld__valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_ld__u0_inputs_ready;
 reg local_bb0_ld__u0_valid_out_NO_SHIFT_REG;
wire local_bb0_ld__u0_stall_in;
wire local_bb0_ld__u0_output_regs_ready;
wire local_bb0_ld__u0_fu_stall_out;
wire local_bb0_ld__u0_fu_valid_out;
wire [31:0] local_bb0_ld__u0_lsu_dataout;
 reg [31:0] local_bb0_ld__u0_NO_SHIFT_REG;
wire local_bb0_ld__u0_causedstall;

lsu_top lsu_local_bb0_ld__u0 (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr((rstag_1to1_bb0_arrayidx2 & 64'hFFFFFFFFFFFFFFFC)),
	.stream_size(input_global_size_0),
	.stream_reset(valid_in),
	.o_stall(local_bb0_ld__u0_fu_stall_out),
	.i_valid(local_bb0_ld__u0_inputs_ready),
	.i_address((rstag_1to1_bb0_arrayidx2 & 64'hFFFFFFFFFFFFFFFC)),
	.i_writedata(),
	.i_cmpdata(),
	.i_predicate(1'b0),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_ld__u0_output_regs_ready)),
	.o_valid(local_bb0_ld__u0_fu_valid_out),
	.o_readdata(local_bb0_ld__u0_lsu_dataout),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_ld__u0_active),
	.avm_address(avm_local_bb0_ld__u0_address),
	.avm_read(avm_local_bb0_ld__u0_read),
	.avm_enable(avm_local_bb0_ld__u0_enable),
	.avm_readdata(avm_local_bb0_ld__u0_readdata),
	.avm_write(avm_local_bb0_ld__u0_write),
	.avm_writeack(avm_local_bb0_ld__u0_writeack),
	.avm_burstcount(avm_local_bb0_ld__u0_burstcount),
	.avm_writedata(avm_local_bb0_ld__u0_writedata),
	.avm_byteenable(avm_local_bb0_ld__u0_byteenable),
	.avm_waitrequest(avm_local_bb0_ld__u0_waitrequest),
	.avm_readdatavalid(avm_local_bb0_ld__u0_readdatavalid),
	.profile_bw(profile_lsu_local_bb0_ld__u0_profile_bw_cntl),
	.profile_bw_incr(profile_lsu_local_bb0_ld__u0_profile_bw_incr),
	.profile_total_ivalid(profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl),
	.profile_avm_burstcount_total(profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl),
	.profile_avm_burstcount_total_incr(profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall(profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl)
);

defparam lsu_local_bb0_ld__u0.AWIDTH = 30;
defparam lsu_local_bb0_ld__u0.WIDTH_BYTES = 4;
defparam lsu_local_bb0_ld__u0.MWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld__u0.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb0_ld__u0.ALIGNMENT_BYTES = 4;
defparam lsu_local_bb0_ld__u0.READ = 1;
defparam lsu_local_bb0_ld__u0.ATOMIC = 0;
defparam lsu_local_bb0_ld__u0.WIDTH = 32;
defparam lsu_local_bb0_ld__u0.MWIDTH = 256;
defparam lsu_local_bb0_ld__u0.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_ld__u0.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_ld__u0.KERNEL_SIDE_MEM_LATENCY = 2;
defparam lsu_local_bb0_ld__u0.MEMORY_SIDE_MEM_LATENCY = 89;
defparam lsu_local_bb0_ld__u0.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_ld__u0.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_ld__u0.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_ld__u0.NUMBER_BANKS = 1;
defparam lsu_local_bb0_ld__u0.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_ld__u0.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb0_ld__u0.USEINPUTFIFO = 0;
defparam lsu_local_bb0_ld__u0.USECACHING = 0;
defparam lsu_local_bb0_ld__u0.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_ld__u0.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_ld__u0.ACL_PROFILE = 1;
defparam lsu_local_bb0_ld__u0.ACL_PROFILE_INCREMENT_WIDTH = 32;
defparam lsu_local_bb0_ld__u0.ADDRSPACE = 1;
defparam lsu_local_bb0_ld__u0.STYLE = "STREAMING";

assign local_bb0_ld__u0_inputs_ready = rstag_1to1_bb0_arrayidx2_valid_out;
assign local_bb0_ld__u0_output_regs_ready = (&(~(local_bb0_ld__u0_valid_out_NO_SHIFT_REG) | ~(local_bb0_ld__u0_stall_in)));
assign rstag_1to1_bb0_arrayidx2_stall_in = (local_bb0_ld__u0_fu_stall_out | ~(local_bb0_ld__u0_inputs_ready));
assign local_bb0_ld__u0_causedstall = (local_bb0_ld__u0_inputs_ready && (local_bb0_ld__u0_fu_stall_out && !(~(local_bb0_ld__u0_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_ld__u0_NO_SHIFT_REG <= 'x;
		local_bb0_ld__u0_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_ld__u0_output_regs_ready)
		begin
			local_bb0_ld__u0_NO_SHIFT_REG <= local_bb0_ld__u0_lsu_dataout;
			local_bb0_ld__u0_valid_out_NO_SHIFT_REG <= local_bb0_ld__u0_fu_valid_out;
		end
		else
		begin
			if (~(local_bb0_ld__u0_stall_in))
			begin
				local_bb0_ld__u0_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_3to3_bb0_ld__valid_out;
wire rstag_3to3_bb0_ld__stall_in;
wire rstag_3to3_bb0_ld__inputs_ready;
wire rstag_3to3_bb0_ld__stall_local;
 reg rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG;
wire rstag_3to3_bb0_ld__combined_valid;
 reg [31:0] rstag_3to3_bb0_ld__staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_3to3_bb0_ld_;

assign rstag_3to3_bb0_ld__inputs_ready = local_bb0_ld__valid_out_NO_SHIFT_REG;
assign rstag_3to3_bb0_ld_ = (rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG ? rstag_3to3_bb0_ld__staging_reg_NO_SHIFT_REG : local_bb0_ld__NO_SHIFT_REG);
assign rstag_3to3_bb0_ld__combined_valid = (rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG | rstag_3to3_bb0_ld__inputs_ready);
assign rstag_3to3_bb0_ld__valid_out = rstag_3to3_bb0_ld__combined_valid;
assign rstag_3to3_bb0_ld__stall_local = rstag_3to3_bb0_ld__stall_in;
assign local_bb0_ld__stall_in = (|rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_3to3_bb0_ld__staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_3to3_bb0_ld__stall_local)
		begin
			if (~(rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG))
			begin
				rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG <= rstag_3to3_bb0_ld__inputs_ready;
			end
		end
		else
		begin
			rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_3to3_bb0_ld__staging_valid_NO_SHIFT_REG))
		begin
			rstag_3to3_bb0_ld__staging_reg_NO_SHIFT_REG <= local_bb0_ld__NO_SHIFT_REG;
		end
	end
end


// This section implements a staging register.
// 
wire rstag_3to3_bb0_ld__u0_valid_out;
wire rstag_3to3_bb0_ld__u0_stall_in;
wire rstag_3to3_bb0_ld__u0_inputs_ready;
wire rstag_3to3_bb0_ld__u0_stall_local;
 reg rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG;
wire rstag_3to3_bb0_ld__u0_combined_valid;
 reg [31:0] rstag_3to3_bb0_ld__u0_staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_3to3_bb0_ld__u0;

assign rstag_3to3_bb0_ld__u0_inputs_ready = local_bb0_ld__u0_valid_out_NO_SHIFT_REG;
assign rstag_3to3_bb0_ld__u0 = (rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG ? rstag_3to3_bb0_ld__u0_staging_reg_NO_SHIFT_REG : local_bb0_ld__u0_NO_SHIFT_REG);
assign rstag_3to3_bb0_ld__u0_combined_valid = (rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG | rstag_3to3_bb0_ld__u0_inputs_ready);
assign rstag_3to3_bb0_ld__u0_valid_out = rstag_3to3_bb0_ld__u0_combined_valid;
assign rstag_3to3_bb0_ld__u0_stall_local = rstag_3to3_bb0_ld__u0_stall_in;
assign local_bb0_ld__u0_stall_in = (|rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_3to3_bb0_ld__u0_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_3to3_bb0_ld__u0_stall_local)
		begin
			if (~(rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG))
			begin
				rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG <= rstag_3to3_bb0_ld__u0_inputs_ready;
			end
		end
		else
		begin
			rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_3to3_bb0_ld__u0_staging_valid_NO_SHIFT_REG))
		begin
			rstag_3to3_bb0_ld__u0_staging_reg_NO_SHIFT_REG <= local_bb0_ld__u0_NO_SHIFT_REG;
		end
	end
end


// This section implements an unregistered operation.
// 
wire local_bb0_add_valid_out;
wire local_bb0_add_stall_in;
wire local_bb0_add_inputs_ready;
wire local_bb0_add_stall_local;
wire [31:0] local_bb0_add;

assign local_bb0_add_inputs_ready = (rstag_3to3_bb0_ld__u0_valid_out & rstag_3to3_bb0_ld__valid_out);
assign local_bb0_add = (rstag_3to3_bb0_ld__u0 + rstag_3to3_bb0_ld_);
assign local_bb0_add_valid_out = local_bb0_add_inputs_ready;
assign local_bb0_add_stall_local = local_bb0_add_stall_in;
assign rstag_3to3_bb0_ld__u0_stall_in = (local_bb0_add_stall_local | ~(local_bb0_add_inputs_ready));
assign rstag_3to3_bb0_ld__stall_in = (local_bb0_add_stall_local | ~(local_bb0_add_inputs_ready));

// This section implements a staging register.
// 
wire rstag_3to3_bb0_add_valid_out;
wire rstag_3to3_bb0_add_stall_in;
wire rstag_3to3_bb0_add_inputs_ready;
wire rstag_3to3_bb0_add_stall_local;
 reg rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG;
wire rstag_3to3_bb0_add_combined_valid;
 reg [31:0] rstag_3to3_bb0_add_staging_reg_NO_SHIFT_REG;
wire [31:0] rstag_3to3_bb0_add;

assign rstag_3to3_bb0_add_inputs_ready = local_bb0_add_valid_out;
assign rstag_3to3_bb0_add = (rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG ? rstag_3to3_bb0_add_staging_reg_NO_SHIFT_REG : local_bb0_add);
assign rstag_3to3_bb0_add_combined_valid = (rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG | rstag_3to3_bb0_add_inputs_ready);
assign rstag_3to3_bb0_add_valid_out = rstag_3to3_bb0_add_combined_valid;
assign rstag_3to3_bb0_add_stall_local = rstag_3to3_bb0_add_stall_in;
assign local_bb0_add_stall_in = (|rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG <= 1'b0;
		rstag_3to3_bb0_add_staging_reg_NO_SHIFT_REG <= 'x;
	end
	else
	begin
		if (rstag_3to3_bb0_add_stall_local)
		begin
			if (~(rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG))
			begin
				rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG <= rstag_3to3_bb0_add_inputs_ready;
			end
		end
		else
		begin
			rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
		if (~(rstag_3to3_bb0_add_staging_valid_NO_SHIFT_REG))
		begin
			rstag_3to3_bb0_add_staging_reg_NO_SHIFT_REG <= local_bb0_add;
		end
	end
end


// This section implements a registered operation.
// 
wire local_bb0_st_add_inputs_ready;
 reg local_bb0_st_add_valid_out_NO_SHIFT_REG;
wire local_bb0_st_add_stall_in;
wire local_bb0_st_add_output_regs_ready;
wire local_bb0_st_add_fu_stall_out;
wire local_bb0_st_add_fu_valid_out;
wire local_bb0_st_add_causedstall;

lsu_top lsu_local_bb0_st_add (
	.clock(clock),
	.clock2x(clock2x),
	.resetn(resetn),
	.flush(start),
	.stream_base_addr((rnode_1to3_bb0_arrayidx4_0_NO_SHIFT_REG & 64'hFFFFFFFFFFFFFFFC)),
	.stream_size(input_global_size_0),
	.stream_reset(valid_in),
	.o_stall(local_bb0_st_add_fu_stall_out),
	.i_valid(local_bb0_st_add_inputs_ready),
	.i_address((rnode_1to3_bb0_arrayidx4_0_NO_SHIFT_REG & 64'hFFFFFFFFFFFFFFFC)),
	.i_writedata(rstag_3to3_bb0_add),
	.i_cmpdata(),
	.i_predicate(1'b0),
	.i_bitwiseor(64'h0),
	.i_byteenable(),
	.i_stall(~(local_bb0_st_add_output_regs_ready)),
	.o_valid(local_bb0_st_add_fu_valid_out),
	.o_readdata(),
	.o_input_fifo_depth(),
	.o_writeack(),
	.i_atomic_op(3'h0),
	.o_active(local_bb0_st_add_active),
	.avm_address(avm_local_bb0_st_add_address),
	.avm_read(avm_local_bb0_st_add_read),
	.avm_enable(avm_local_bb0_st_add_enable),
	.avm_readdata(avm_local_bb0_st_add_readdata),
	.avm_write(avm_local_bb0_st_add_write),
	.avm_writeack(avm_local_bb0_st_add_writeack),
	.avm_burstcount(avm_local_bb0_st_add_burstcount),
	.avm_writedata(avm_local_bb0_st_add_writedata),
	.avm_byteenable(avm_local_bb0_st_add_byteenable),
	.avm_waitrequest(avm_local_bb0_st_add_waitrequest),
	.avm_readdatavalid(avm_local_bb0_st_add_readdatavalid),
	.profile_bw(profile_lsu_local_bb0_st_add_profile_bw_cntl),
	.profile_bw_incr(profile_lsu_local_bb0_st_add_profile_bw_incr),
	.profile_total_ivalid(profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl),
	.profile_total_req(),
	.profile_i_stall_count(),
	.profile_o_stall_count(),
	.profile_avm_readwrite_count(profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl),
	.profile_avm_burstcount_total(profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl),
	.profile_avm_burstcount_total_incr(profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr),
	.profile_req_cache_hit_count(),
	.profile_extra_unaligned_reqs(),
	.profile_avm_stall(profile_lsu_local_bb0_st_add_profile_avm_stall_cntl)
);

defparam lsu_local_bb0_st_add.AWIDTH = 30;
defparam lsu_local_bb0_st_add.WIDTH_BYTES = 4;
defparam lsu_local_bb0_st_add.MWIDTH_BYTES = 32;
defparam lsu_local_bb0_st_add.WRITEDATAWIDTH_BYTES = 32;
defparam lsu_local_bb0_st_add.ALIGNMENT_BYTES = 4;
defparam lsu_local_bb0_st_add.READ = 0;
defparam lsu_local_bb0_st_add.ATOMIC = 0;
defparam lsu_local_bb0_st_add.WIDTH = 32;
defparam lsu_local_bb0_st_add.MWIDTH = 256;
defparam lsu_local_bb0_st_add.ATOMIC_WIDTH = 3;
defparam lsu_local_bb0_st_add.BURSTCOUNT_WIDTH = 5;
defparam lsu_local_bb0_st_add.KERNEL_SIDE_MEM_LATENCY = 2;
defparam lsu_local_bb0_st_add.MEMORY_SIDE_MEM_LATENCY = 32;
defparam lsu_local_bb0_st_add.USE_WRITE_ACK = 0;
defparam lsu_local_bb0_st_add.ENABLE_BANKED_MEMORY = 0;
defparam lsu_local_bb0_st_add.ABITS_PER_LMEM_BANK = 0;
defparam lsu_local_bb0_st_add.NUMBER_BANKS = 1;
defparam lsu_local_bb0_st_add.LMEM_ADDR_PERMUTATION_STYLE = 0;
defparam lsu_local_bb0_st_add.INTENDED_DEVICE_FAMILY = "Cyclone V";
defparam lsu_local_bb0_st_add.USEINPUTFIFO = 0;
defparam lsu_local_bb0_st_add.USECACHING = 0;
defparam lsu_local_bb0_st_add.USEOUTPUTFIFO = 1;
defparam lsu_local_bb0_st_add.FORCE_NOP_SUPPORT = 0;
defparam lsu_local_bb0_st_add.ACL_PROFILE = 1;
defparam lsu_local_bb0_st_add.ACL_PROFILE_INCREMENT_WIDTH = 32;
defparam lsu_local_bb0_st_add.ADDRSPACE = 1;
defparam lsu_local_bb0_st_add.STYLE = "STREAMING";
defparam lsu_local_bb0_st_add.USE_BYTE_EN = 0;

assign local_bb0_st_add_inputs_ready = (rnode_1to3_bb0_arrayidx4_0_valid_out_NO_SHIFT_REG & rstag_3to3_bb0_add_valid_out);
assign local_bb0_st_add_output_regs_ready = (&(~(local_bb0_st_add_valid_out_NO_SHIFT_REG) | ~(local_bb0_st_add_stall_in)));
assign rnode_1to3_bb0_arrayidx4_0_stall_in_NO_SHIFT_REG = (local_bb0_st_add_fu_stall_out | ~(local_bb0_st_add_inputs_ready));
assign rstag_3to3_bb0_add_stall_in = (local_bb0_st_add_fu_stall_out | ~(local_bb0_st_add_inputs_ready));
assign local_bb0_st_add_causedstall = (local_bb0_st_add_inputs_ready && (local_bb0_st_add_fu_stall_out && !(~(local_bb0_st_add_output_regs_ready))));

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		local_bb0_st_add_valid_out_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (local_bb0_st_add_output_regs_ready)
		begin
			local_bb0_st_add_valid_out_NO_SHIFT_REG <= local_bb0_st_add_fu_valid_out;
		end
		else
		begin
			if (~(local_bb0_st_add_stall_in))
			begin
				local_bb0_st_add_valid_out_NO_SHIFT_REG <= 1'b0;
			end
		end
	end
end


// This section implements a staging register.
// 
wire rstag_5to5_bb0_st_add_valid_out;
wire rstag_5to5_bb0_st_add_stall_in;
wire rstag_5to5_bb0_st_add_inputs_ready;
wire rstag_5to5_bb0_st_add_stall_local;
 reg rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG;
wire rstag_5to5_bb0_st_add_combined_valid;

assign rstag_5to5_bb0_st_add_inputs_ready = local_bb0_st_add_valid_out_NO_SHIFT_REG;
assign rstag_5to5_bb0_st_add_combined_valid = (rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG | rstag_5to5_bb0_st_add_inputs_ready);
assign rstag_5to5_bb0_st_add_valid_out = rstag_5to5_bb0_st_add_combined_valid;
assign rstag_5to5_bb0_st_add_stall_local = rstag_5to5_bb0_st_add_stall_in;
assign local_bb0_st_add_stall_in = (|rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG);

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (rstag_5to5_bb0_st_add_stall_local)
		begin
			if (~(rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG))
			begin
				rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG <= rstag_5to5_bb0_st_add_inputs_ready;
			end
		end
		else
		begin
			rstag_5to5_bb0_st_add_staging_valid_NO_SHIFT_REG <= 1'b0;
		end
	end
end


// This section describes the behaviour of the BRANCH node.
wire branch_var__inputs_ready;
wire branch_var__output_regs_ready;

assign branch_var__inputs_ready = rstag_5to5_bb0_st_add_valid_out;
assign branch_var__output_regs_ready = ~(stall_in);
assign rstag_5to5_bb0_st_add_stall_in = (~(branch_var__output_regs_ready) | ~(branch_var__inputs_ready));
assign valid_out = branch_var__inputs_ready;

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vector_add_function
	(
		input 		clock,
		input 		resetn,
		input [31:0] 		input_global_id_0,
		output 		stall_out,
		input 		valid_in,
		output 		valid_out,
		input 		stall_in,
		input [31:0] 		workgroup_size,
		output 		avm_local_bb0_ld__enable,
		input [255:0] 		avm_local_bb0_ld__readdata,
		input 		avm_local_bb0_ld__readdatavalid,
		input 		avm_local_bb0_ld__waitrequest,
		output [29:0] 		avm_local_bb0_ld__address,
		output 		avm_local_bb0_ld__read,
		output 		avm_local_bb0_ld__write,
		input 		avm_local_bb0_ld__writeack,
		output [255:0] 		avm_local_bb0_ld__writedata,
		output [31:0] 		avm_local_bb0_ld__byteenable,
		output [4:0] 		avm_local_bb0_ld__burstcount,
		output 		profile_lsu_local_bb0_ld__profile_bw_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__profile_bw_incr,
		output 		profile_lsu_local_bb0_ld__profile_total_ivalid_cntl,
		output 		profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl,
		output 		profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr,
		output 		profile_lsu_local_bb0_ld__profile_avm_stall_cntl,
		output 		avm_local_bb0_ld__u0_enable,
		input [255:0] 		avm_local_bb0_ld__u0_readdata,
		input 		avm_local_bb0_ld__u0_readdatavalid,
		input 		avm_local_bb0_ld__u0_waitrequest,
		output [29:0] 		avm_local_bb0_ld__u0_address,
		output 		avm_local_bb0_ld__u0_read,
		output 		avm_local_bb0_ld__u0_write,
		input 		avm_local_bb0_ld__u0_writeack,
		output [255:0] 		avm_local_bb0_ld__u0_writedata,
		output [31:0] 		avm_local_bb0_ld__u0_byteenable,
		output [4:0] 		avm_local_bb0_ld__u0_burstcount,
		output 		profile_lsu_local_bb0_ld__u0_profile_bw_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__u0_profile_bw_incr,
		output 		profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl,
		output 		profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl,
		output 		profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl,
		output [31:0] 		profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr,
		output 		profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl,
		output 		avm_local_bb0_st_add_enable,
		input [255:0] 		avm_local_bb0_st_add_readdata,
		input 		avm_local_bb0_st_add_readdatavalid,
		input 		avm_local_bb0_st_add_waitrequest,
		output [29:0] 		avm_local_bb0_st_add_address,
		output 		avm_local_bb0_st_add_read,
		output 		avm_local_bb0_st_add_write,
		input 		avm_local_bb0_st_add_writeack,
		output [255:0] 		avm_local_bb0_st_add_writedata,
		output [31:0] 		avm_local_bb0_st_add_byteenable,
		output [4:0] 		avm_local_bb0_st_add_burstcount,
		output 		profile_lsu_local_bb0_st_add_profile_bw_cntl,
		output [31:0] 		profile_lsu_local_bb0_st_add_profile_bw_incr,
		output 		profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl,
		output 		profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl,
		output 		profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl,
		output [31:0] 		profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr,
		output 		profile_lsu_local_bb0_st_add_profile_avm_stall_cntl,
		input 		clock2x,
		input 		start,
		input [63:0] 		input_x,
		input [31:0] 		input_global_size_0,
		input [63:0] 		input_y,
		input [63:0] 		input_z,
		output 		profile_clock,
		output reg 		has_a_write_pending,
		output reg 		has_a_lsu_active
	);


wire [31:0] cur_cycle;
wire bb_0_stall_out;
wire bb_0_valid_out;
wire bb_0_local_bb0_ld__active;
wire bb_0_local_bb0_ld__u0_active;
wire bb_0_local_bb0_st_add_active;
wire writes_pending;
wire [2:0] lsus_active;

vector_add_sys_cycle_time system_cycle_time_module (
	.clock(clock),
	.resetn(resetn),
	.cur_cycle(cur_cycle)
);


vector_add_basic_block_0 vector_add_basic_block_0 (
	.clock(clock),
	.resetn(resetn),
	.input_x(input_x),
	.input_global_size_0(input_global_size_0),
	.input_y(input_y),
	.input_z(input_z),
	.valid_in(valid_in),
	.stall_out(bb_0_stall_out),
	.input_global_id_0(input_global_id_0),
	.valid_out(bb_0_valid_out),
	.stall_in(stall_in),
	.workgroup_size(workgroup_size),
	.start(start),
	.avm_local_bb0_ld__enable(avm_local_bb0_ld__enable),
	.avm_local_bb0_ld__readdata(avm_local_bb0_ld__readdata),
	.avm_local_bb0_ld__readdatavalid(avm_local_bb0_ld__readdatavalid),
	.avm_local_bb0_ld__waitrequest(avm_local_bb0_ld__waitrequest),
	.avm_local_bb0_ld__address(avm_local_bb0_ld__address),
	.avm_local_bb0_ld__read(avm_local_bb0_ld__read),
	.avm_local_bb0_ld__write(avm_local_bb0_ld__write),
	.avm_local_bb0_ld__writeack(avm_local_bb0_ld__writeack),
	.avm_local_bb0_ld__writedata(avm_local_bb0_ld__writedata),
	.avm_local_bb0_ld__byteenable(avm_local_bb0_ld__byteenable),
	.avm_local_bb0_ld__burstcount(avm_local_bb0_ld__burstcount),
	.profile_lsu_local_bb0_ld__profile_bw_cntl(profile_lsu_local_bb0_ld__profile_bw_cntl),
	.profile_lsu_local_bb0_ld__profile_bw_incr(profile_lsu_local_bb0_ld__profile_bw_incr),
	.profile_lsu_local_bb0_ld__profile_total_ivalid_cntl(profile_lsu_local_bb0_ld__profile_total_ivalid_cntl),
	.profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl(profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl),
	.profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl(profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl),
	.profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr(profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr),
	.profile_lsu_local_bb0_ld__profile_avm_stall_cntl(profile_lsu_local_bb0_ld__profile_avm_stall_cntl),
	.local_bb0_ld__active(bb_0_local_bb0_ld__active),
	.clock2x(clock2x),
	.avm_local_bb0_ld__u0_enable(avm_local_bb0_ld__u0_enable),
	.avm_local_bb0_ld__u0_readdata(avm_local_bb0_ld__u0_readdata),
	.avm_local_bb0_ld__u0_readdatavalid(avm_local_bb0_ld__u0_readdatavalid),
	.avm_local_bb0_ld__u0_waitrequest(avm_local_bb0_ld__u0_waitrequest),
	.avm_local_bb0_ld__u0_address(avm_local_bb0_ld__u0_address),
	.avm_local_bb0_ld__u0_read(avm_local_bb0_ld__u0_read),
	.avm_local_bb0_ld__u0_write(avm_local_bb0_ld__u0_write),
	.avm_local_bb0_ld__u0_writeack(avm_local_bb0_ld__u0_writeack),
	.avm_local_bb0_ld__u0_writedata(avm_local_bb0_ld__u0_writedata),
	.avm_local_bb0_ld__u0_byteenable(avm_local_bb0_ld__u0_byteenable),
	.avm_local_bb0_ld__u0_burstcount(avm_local_bb0_ld__u0_burstcount),
	.profile_lsu_local_bb0_ld__u0_profile_bw_cntl(profile_lsu_local_bb0_ld__u0_profile_bw_cntl),
	.profile_lsu_local_bb0_ld__u0_profile_bw_incr(profile_lsu_local_bb0_ld__u0_profile_bw_incr),
	.profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl(profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl),
	.profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl(profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl),
	.profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl(profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl),
	.profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr(profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr),
	.profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl(profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl),
	.local_bb0_ld__u0_active(bb_0_local_bb0_ld__u0_active),
	.avm_local_bb0_st_add_enable(avm_local_bb0_st_add_enable),
	.avm_local_bb0_st_add_readdata(avm_local_bb0_st_add_readdata),
	.avm_local_bb0_st_add_readdatavalid(avm_local_bb0_st_add_readdatavalid),
	.avm_local_bb0_st_add_waitrequest(avm_local_bb0_st_add_waitrequest),
	.avm_local_bb0_st_add_address(avm_local_bb0_st_add_address),
	.avm_local_bb0_st_add_read(avm_local_bb0_st_add_read),
	.avm_local_bb0_st_add_write(avm_local_bb0_st_add_write),
	.avm_local_bb0_st_add_writeack(avm_local_bb0_st_add_writeack),
	.avm_local_bb0_st_add_writedata(avm_local_bb0_st_add_writedata),
	.avm_local_bb0_st_add_byteenable(avm_local_bb0_st_add_byteenable),
	.avm_local_bb0_st_add_burstcount(avm_local_bb0_st_add_burstcount),
	.profile_lsu_local_bb0_st_add_profile_bw_cntl(profile_lsu_local_bb0_st_add_profile_bw_cntl),
	.profile_lsu_local_bb0_st_add_profile_bw_incr(profile_lsu_local_bb0_st_add_profile_bw_incr),
	.profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl(profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl),
	.profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl(profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl),
	.profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl(profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl),
	.profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr(profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr),
	.profile_lsu_local_bb0_st_add_profile_avm_stall_cntl(profile_lsu_local_bb0_st_add_profile_avm_stall_cntl),
	.local_bb0_st_add_active(bb_0_local_bb0_st_add_active)
);


assign valid_out = bb_0_valid_out;
assign stall_out = bb_0_stall_out;
assign profile_clock = 1'b1;
assign writes_pending = bb_0_local_bb0_st_add_active;
assign lsus_active[0] = bb_0_local_bb0_ld__active;
assign lsus_active[1] = bb_0_local_bb0_ld__u0_active;
assign lsus_active[2] = bb_0_local_bb0_st_add_active;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		has_a_write_pending <= 1'b0;
		has_a_lsu_active <= 1'b0;
	end
	else
	begin
		has_a_write_pending <= (|writes_pending);
		has_a_lsu_active <= (|lsus_active);
	end
end

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vector_add_function_wrapper
	(
		input 		clock,
		input 		resetn,
		input 		clock2x,
		input 		local_router_hang,
		input 		profile_extmem_vector_add_function_bank0_port0_read_data_inc_en,
		input 		profile_extmem_vector_add_function_bank0_port0_read_burst_count_en,
		input 		profile_extmem_vector_add_function_bank0_port0_write_data_inc_en,
		input 		profile_extmem_vector_add_function_bank0_port0_write_burst_count_en,
		input 		avs_cra_enable,
		input 		avs_cra_read,
		input 		avs_cra_write,
		input [3:0] 		avs_cra_address,
		input [63:0] 		avs_cra_writedata,
		input [7:0] 		avs_cra_byteenable,
		output reg [63:0] 		avs_cra_readdata,
		output reg 		avs_cra_readdatavalid,
		output 		cra_irq,
		output 		avm_local_bb0_ld__inst0_enable,
		input [255:0] 		avm_local_bb0_ld__inst0_readdata,
		input 		avm_local_bb0_ld__inst0_readdatavalid,
		input 		avm_local_bb0_ld__inst0_waitrequest,
		output [29:0] 		avm_local_bb0_ld__inst0_address,
		output 		avm_local_bb0_ld__inst0_read,
		output 		avm_local_bb0_ld__inst0_write,
		input 		avm_local_bb0_ld__inst0_writeack,
		output [255:0] 		avm_local_bb0_ld__inst0_writedata,
		output [31:0] 		avm_local_bb0_ld__inst0_byteenable,
		output [4:0] 		avm_local_bb0_ld__inst0_burstcount,
		output 		avm_local_bb0_ld__u0_inst0_enable,
		input [255:0] 		avm_local_bb0_ld__u0_inst0_readdata,
		input 		avm_local_bb0_ld__u0_inst0_readdatavalid,
		input 		avm_local_bb0_ld__u0_inst0_waitrequest,
		output [29:0] 		avm_local_bb0_ld__u0_inst0_address,
		output 		avm_local_bb0_ld__u0_inst0_read,
		output 		avm_local_bb0_ld__u0_inst0_write,
		input 		avm_local_bb0_ld__u0_inst0_writeack,
		output [255:0] 		avm_local_bb0_ld__u0_inst0_writedata,
		output [31:0] 		avm_local_bb0_ld__u0_inst0_byteenable,
		output [4:0] 		avm_local_bb0_ld__u0_inst0_burstcount,
		output 		avm_local_bb0_st_add_inst0_enable,
		input [255:0] 		avm_local_bb0_st_add_inst0_readdata,
		input 		avm_local_bb0_st_add_inst0_readdatavalid,
		input 		avm_local_bb0_st_add_inst0_waitrequest,
		output [29:0] 		avm_local_bb0_st_add_inst0_address,
		output 		avm_local_bb0_st_add_inst0_read,
		output 		avm_local_bb0_st_add_inst0_write,
		input 		avm_local_bb0_st_add_inst0_writeack,
		output [255:0] 		avm_local_bb0_st_add_inst0_writedata,
		output [31:0] 		avm_local_bb0_st_add_inst0_byteenable,
		output [4:0] 		avm_local_bb0_st_add_inst0_burstcount
	);

// Responsible for interfacing a kernel with the outside world. It comprises a
// slave interface to specify the kernel arguments and retain kernel status. 

// This section of the wrapper implements the slave interface.
// twoXclock_consumer uses clock2x, even if nobody inside the kernel does. Keeps interface to acl_iface consistent for all kernels.
 reg start_NO_SHIFT_REG;
 reg started_NO_SHIFT_REG;
wire finish;
 reg [31:0] status_NO_SHIFT_REG;
wire has_a_write_pending;
wire has_a_lsu_active;
 reg [191:0] kernel_arguments_NO_SHIFT_REG;
 reg twoXclock_consumer_NO_SHIFT_REG /* synthesis  preserve  noprune  */;
 reg [31:0] workgroup_size_NO_SHIFT_REG;
 reg [31:0] global_size_NO_SHIFT_REG[2:0];
 reg [31:0] num_groups_NO_SHIFT_REG[2:0];
 reg [31:0] local_size_NO_SHIFT_REG[2:0];
 reg [31:0] work_dim_NO_SHIFT_REG;
 reg [31:0] global_offset_NO_SHIFT_REG[2:0];
 reg [63:0] profile_data_NO_SHIFT_REG;
 reg [31:0] profile_ctrl_NO_SHIFT_REG;
 reg [63:0] profile_start_cycle_NO_SHIFT_REG;
 reg [63:0] profile_stop_cycle_NO_SHIFT_REG;
wire dispatched_all_groups;
wire [31:0] group_id_tmp[2:0];
wire [31:0] global_id_base_out[2:0];
wire start_out;
wire [31:0] local_id[0:0][2:0];
wire [31:0] global_id[0:0][2:0];
wire [31:0] group_id[0:0][2:0];
wire iter_valid_in;
wire iter_stall_out;
wire stall_in;
wire stall_out;
wire valid_in;
wire valid_out;

always @(posedge clock2x or negedge resetn)
begin
	if (~(resetn))
	begin
		twoXclock_consumer_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		twoXclock_consumer_NO_SHIFT_REG <= 1'b1;
	end
end


// Profiling IP for various signals.
 reg profile_reset_reg_NO_SHIFT_REG;
 reg [63:0] profile_cycle_counter_NO_SHIFT_REG;
 reg profile_cycle_count_in_range_reg_NO_SHIFT_REG;
wire [63:0] profile_data_wire;
wire profile_shift_wire;
wire profile_reset_n_wire;
wire profile_enable_wire;
wire [19:0] profile_increment_cntl;
wire [639:0] profile_increment_val;

acl_profiler profiler_inst (
	.clock(clock),
	.profile_shift(profile_shift_wire),
	.incr_cntl(profile_increment_cntl),
	.incr_val(profile_increment_val),
	.daisy_out(profile_data_wire),
	.resetn(profile_reset_n_wire),
	.enable(profile_enable_wire)
);

defparam profiler_inst.COUNTER_WIDTH = 64;
defparam profiler_inst.INCREMENT_WIDTH = 32;
defparam profiler_inst.NUM_COUNTERS = 20;
defparam profiler_inst.DAISY_WIDTH = 64;


// Work group dispatcher is responsible for issuing work-groups to id iterator(s)
acl_work_group_dispatcher group_dispatcher (
	.clock(clock),
	.resetn(resetn),
	.start(start_NO_SHIFT_REG),
	.num_groups(num_groups_NO_SHIFT_REG),
	.local_size(local_size_NO_SHIFT_REG),
	.stall_in(iter_stall_out),
	.valid_out(iter_valid_in),
	.group_id_out(group_id_tmp),
	.global_id_base_out(global_id_base_out),
	.start_out(start_out),
	.dispatched_all_groups(dispatched_all_groups)
);

defparam group_dispatcher.NUM_COPIES = 1;
defparam group_dispatcher.RUN_FOREVER = 0;


// This section of the wrapper implements an Avalon Slave Interface used to configure a kernel invocation.
// The few words words contain the status and the workgroup size registers.
// The remaining addressable space is reserved for kernel arguments.
 reg [63:0] cra_readdata_st1_NO_SHIFT_REG;
 reg [3:0] cra_addr_st1_NO_SHIFT_REG;
 reg cra_read_st1_NO_SHIFT_REG;
wire [63:0] bitenable;

assign bitenable[7:0] = (avs_cra_byteenable[0] ? 8'hFF : 8'h0);
assign bitenable[15:8] = (avs_cra_byteenable[1] ? 8'hFF : 8'h0);
assign bitenable[23:16] = (avs_cra_byteenable[2] ? 8'hFF : 8'h0);
assign bitenable[31:24] = (avs_cra_byteenable[3] ? 8'hFF : 8'h0);
assign bitenable[39:32] = (avs_cra_byteenable[4] ? 8'hFF : 8'h0);
assign bitenable[47:40] = (avs_cra_byteenable[5] ? 8'hFF : 8'h0);
assign bitenable[55:48] = (avs_cra_byteenable[6] ? 8'hFF : 8'h0);
assign bitenable[63:56] = (avs_cra_byteenable[7] ? 8'hFF : 8'h0);
assign cra_irq = (status_NO_SHIFT_REG[1] | status_NO_SHIFT_REG[3]);
assign profile_enable_wire = (profile_cycle_count_in_range_reg_NO_SHIFT_REG & (started_NO_SHIFT_REG & profile_ctrl_NO_SHIFT_REG[2]));
assign profile_reset_n_wire = (resetn & ~(profile_reset_reg_NO_SHIFT_REG));
assign profile_shift_wire = profile_ctrl_NO_SHIFT_REG[0];

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		start_NO_SHIFT_REG <= 1'b0;
		started_NO_SHIFT_REG <= 1'b0;
		kernel_arguments_NO_SHIFT_REG <= 192'h0;
		status_NO_SHIFT_REG <= 32'h30000;
		profile_ctrl_NO_SHIFT_REG <= 32'h4;
		profile_start_cycle_NO_SHIFT_REG <= 64'h0;
		profile_stop_cycle_NO_SHIFT_REG <= 64'hFFFFFFFFFFFFFFFF;
		work_dim_NO_SHIFT_REG <= 32'h0;
		workgroup_size_NO_SHIFT_REG <= 32'h0;
		global_size_NO_SHIFT_REG[0] <= 32'h0;
		global_size_NO_SHIFT_REG[1] <= 32'h0;
		global_size_NO_SHIFT_REG[2] <= 32'h0;
		num_groups_NO_SHIFT_REG[0] <= 32'h0;
		num_groups_NO_SHIFT_REG[1] <= 32'h0;
		num_groups_NO_SHIFT_REG[2] <= 32'h0;
		local_size_NO_SHIFT_REG[0] <= 32'h0;
		local_size_NO_SHIFT_REG[1] <= 32'h0;
		local_size_NO_SHIFT_REG[2] <= 32'h0;
		global_offset_NO_SHIFT_REG[0] <= 32'h0;
		global_offset_NO_SHIFT_REG[1] <= 32'h0;
		global_offset_NO_SHIFT_REG[2] <= 32'h0;
		profile_reset_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		if (avs_cra_write)
		begin
			case (avs_cra_address)
				4'h0:
				begin
					status_NO_SHIFT_REG[31:16] <= 16'h3;
					status_NO_SHIFT_REG[15:0] <= ((status_NO_SHIFT_REG[15:0] & ~(bitenable[15:0])) | (avs_cra_writedata[15:0] & bitenable[15:0]));
				end

				4'h1:
				begin
					profile_ctrl_NO_SHIFT_REG <= ((profile_ctrl_NO_SHIFT_REG & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h3:
				begin
					profile_start_cycle_NO_SHIFT_REG[31:0] <= ((profile_start_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_start_cycle_NO_SHIFT_REG[63:32] <= ((profile_start_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h4:
				begin
					profile_stop_cycle_NO_SHIFT_REG[31:0] <= ((profile_stop_cycle_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					profile_stop_cycle_NO_SHIFT_REG[63:32] <= ((profile_stop_cycle_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h5:
				begin
					work_dim_NO_SHIFT_REG <= ((work_dim_NO_SHIFT_REG & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					workgroup_size_NO_SHIFT_REG <= ((workgroup_size_NO_SHIFT_REG & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h6:
				begin
					global_size_NO_SHIFT_REG[0] <= ((global_size_NO_SHIFT_REG[0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_size_NO_SHIFT_REG[1] <= ((global_size_NO_SHIFT_REG[1] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h7:
				begin
					global_size_NO_SHIFT_REG[2] <= ((global_size_NO_SHIFT_REG[2] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_NO_SHIFT_REG[0] <= ((num_groups_NO_SHIFT_REG[0] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h8:
				begin
					num_groups_NO_SHIFT_REG[1] <= ((num_groups_NO_SHIFT_REG[1] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					num_groups_NO_SHIFT_REG[2] <= ((num_groups_NO_SHIFT_REG[2] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'h9:
				begin
					local_size_NO_SHIFT_REG[0] <= ((local_size_NO_SHIFT_REG[0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					local_size_NO_SHIFT_REG[1] <= ((local_size_NO_SHIFT_REG[1] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hA:
				begin
					local_size_NO_SHIFT_REG[2] <= ((local_size_NO_SHIFT_REG[2] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_NO_SHIFT_REG[0] <= ((global_offset_NO_SHIFT_REG[0] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hB:
				begin
					global_offset_NO_SHIFT_REG[1] <= ((global_offset_NO_SHIFT_REG[1] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					global_offset_NO_SHIFT_REG[2] <= ((global_offset_NO_SHIFT_REG[2] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hC:
				begin
					kernel_arguments_NO_SHIFT_REG[31:0] <= ((kernel_arguments_NO_SHIFT_REG[31:0] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments_NO_SHIFT_REG[63:32] <= ((kernel_arguments_NO_SHIFT_REG[63:32] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hD:
				begin
					kernel_arguments_NO_SHIFT_REG[95:64] <= ((kernel_arguments_NO_SHIFT_REG[95:64] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments_NO_SHIFT_REG[127:96] <= ((kernel_arguments_NO_SHIFT_REG[127:96] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				4'hE:
				begin
					kernel_arguments_NO_SHIFT_REG[159:128] <= ((kernel_arguments_NO_SHIFT_REG[159:128] & ~(bitenable[31:0])) | (avs_cra_writedata[31:0] & bitenable[31:0]));
					kernel_arguments_NO_SHIFT_REG[191:160] <= ((kernel_arguments_NO_SHIFT_REG[191:160] & ~(bitenable[63:32])) | (avs_cra_writedata[63:32] & bitenable[63:32]));
				end

				default:
				begin
				end

			endcase
		end
		else
		begin
			if (profile_ctrl_NO_SHIFT_REG[1])
			begin
				if (profile_reset_reg_NO_SHIFT_REG)
				begin
					profile_ctrl_NO_SHIFT_REG[1] <= 1'b0;
				end
				else
				begin
					profile_reset_reg_NO_SHIFT_REG <= 1'b1;
				end
			end
			else
			begin
				profile_reset_reg_NO_SHIFT_REG <= 1'b0;
			end
			profile_ctrl_NO_SHIFT_REG[0] <= 1'b0;
			if (status_NO_SHIFT_REG[0])
			begin
				start_NO_SHIFT_REG <= 1'b1;
			end
			if (start_NO_SHIFT_REG)
			begin
				status_NO_SHIFT_REG[0] <= 1'b0;
				started_NO_SHIFT_REG <= 1'b1;
			end
			if (started_NO_SHIFT_REG)
			begin
				start_NO_SHIFT_REG <= 1'b0;
			end
			if (finish)
			begin
				status_NO_SHIFT_REG[1] <= 1'b1;
				started_NO_SHIFT_REG <= 1'b0;
			end
		end
		status_NO_SHIFT_REG[11] <= 1'b0;
		status_NO_SHIFT_REG[12] <= (|has_a_lsu_active);
		status_NO_SHIFT_REG[13] <= (|has_a_write_pending);
		status_NO_SHIFT_REG[14] <= (|valid_in);
		status_NO_SHIFT_REG[15] <= started_NO_SHIFT_REG;
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		cra_read_st1_NO_SHIFT_REG <= 1'b0;
		cra_addr_st1_NO_SHIFT_REG <= 4'h0;
		cra_readdata_st1_NO_SHIFT_REG <= 64'h0;
	end
	else
	begin
		cra_read_st1_NO_SHIFT_REG <= avs_cra_read;
		cra_addr_st1_NO_SHIFT_REG <= avs_cra_address;
		case (avs_cra_address)
			4'h0:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= status_NO_SHIFT_REG;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= 32'h0;
			end

			4'h1:
			begin
				cra_readdata_st1_NO_SHIFT_REG[31:0] <= 'x;
				cra_readdata_st1_NO_SHIFT_REG[63:32] <= profile_ctrl_NO_SHIFT_REG;
			end

			4'h2:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= profile_data_NO_SHIFT_REG;
			end

			4'h3:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= profile_start_cycle_NO_SHIFT_REG;
			end

			4'h4:
			begin
				cra_readdata_st1_NO_SHIFT_REG[63:0] <= profile_stop_cycle_NO_SHIFT_REG;
			end

			default:
			begin
				cra_readdata_st1_NO_SHIFT_REG <= status_NO_SHIFT_REG;
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		avs_cra_readdatavalid <= 1'b0;
		avs_cra_readdata <= 64'h0;
	end
	else
	begin
		avs_cra_readdatavalid <= cra_read_st1_NO_SHIFT_REG;
		case (cra_addr_st1_NO_SHIFT_REG)
			4'h2:
			begin
				avs_cra_readdata[63:0] <= profile_data_NO_SHIFT_REG;
			end

			default:
			begin
				avs_cra_readdata <= cra_readdata_st1_NO_SHIFT_REG;
			end

		endcase
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		profile_data_NO_SHIFT_REG <= 64'h0;
	end
	else
	begin
		if (profile_shift_wire)
		begin
			profile_data_NO_SHIFT_REG <= profile_data_wire;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		profile_cycle_counter_NO_SHIFT_REG <= 64'h0;
	end
	else
	begin
		if (started_NO_SHIFT_REG)
		begin
			profile_cycle_counter_NO_SHIFT_REG <= (profile_cycle_counter_NO_SHIFT_REG + 64'h1);
		end
		else
		begin
			profile_cycle_counter_NO_SHIFT_REG <= 64'h0;
		end
	end
end

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		profile_cycle_count_in_range_reg_NO_SHIFT_REG <= 1'b0;
	end
	else
	begin
		profile_cycle_count_in_range_reg_NO_SHIFT_REG <= ((profile_cycle_counter_NO_SHIFT_REG >= profile_start_cycle_NO_SHIFT_REG) & (profile_cycle_counter_NO_SHIFT_REG < profile_stop_cycle_NO_SHIFT_REG));
	end
end


// Handshaking signals used to control data through the pipeline

// Determine when the kernel is finished.
acl_kernel_finish_detector kernel_finish_detector (
	.clock(clock),
	.resetn(resetn),
	.start(start_NO_SHIFT_REG),
	.wg_size(workgroup_size_NO_SHIFT_REG),
	.wg_dispatch_valid_out(iter_valid_in),
	.wg_dispatch_stall_in(iter_stall_out),
	.dispatched_all_groups(dispatched_all_groups),
	.kernel_copy_valid_out(valid_out),
	.kernel_copy_stall_in(stall_in),
	.pending_writes(has_a_write_pending),
	.finish(finish)
);

defparam kernel_finish_detector.TESSELLATION_SIZE = 0;
defparam kernel_finish_detector.NUM_COPIES = 1;
defparam kernel_finish_detector.WG_SIZE_W = 32;

assign stall_in = 1'b0;

// Creating ID iterator and kernel instance for every requested kernel copy

// ID iterator is responsible for iterating over all local ids for given work-groups
acl_id_iterator id_iter_inst0 (
	.clock(clock),
	.resetn(resetn),
	.start(start_out),
	.valid_in(iter_valid_in),
	.stall_out(iter_stall_out),
	.stall_in(stall_out),
	.valid_out(valid_in),
	.group_id_in(group_id_tmp),
	.global_id_base_in(global_id_base_out),
	.local_size(local_size_NO_SHIFT_REG),
	.global_size(global_size_NO_SHIFT_REG),
	.local_id(local_id[0]),
	.global_id(global_id[0]),
	.group_id(group_id[0])
);

defparam id_iter_inst0.LOCAL_WIDTH_X = 32;
defparam id_iter_inst0.LOCAL_WIDTH_Y = 32;
defparam id_iter_inst0.LOCAL_WIDTH_Z = 32;


// This section instantiates a kernel function block
wire profile_lsu_local_bb0_ld__profile_bw_cntl_inst0_wire_0;
wire [31:0] profile_lsu_local_bb0_ld__profile_bw_incr_inst0_wire_0;
wire profile_lsu_local_bb0_ld__profile_total_ivalid_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl_inst0_wire_0;
wire [31:0] profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr_inst0_wire_0;
wire profile_lsu_local_bb0_ld__profile_avm_stall_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_ld__u0_profile_bw_cntl_inst0_wire_0;
wire [31:0] profile_lsu_local_bb0_ld__u0_profile_bw_incr_inst0_wire_0;
wire profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl_inst0_wire_0;
wire [31:0] profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr_inst0_wire_0;
wire profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_st_add_profile_bw_cntl_inst0_wire_0;
wire [31:0] profile_lsu_local_bb0_st_add_profile_bw_incr_inst0_wire_0;
wire profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl_inst0_wire_0;
wire profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl_inst0_wire_0;
wire [31:0] profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr_inst0_wire_0;
wire profile_lsu_local_bb0_st_add_profile_avm_stall_cntl_inst0_wire_0;
wire profile_clock_inst0_wire_0;

vector_add_function vector_add_function_inst0 (
	.clock(clock),
	.resetn(resetn),
	.input_global_id_0(global_id[0][0]),
	.stall_out(stall_out),
	.valid_in(valid_in),
	.valid_out(valid_out),
	.stall_in(stall_in),
	.workgroup_size(workgroup_size_NO_SHIFT_REG),
	.avm_local_bb0_ld__enable(avm_local_bb0_ld__inst0_enable),
	.avm_local_bb0_ld__readdata(avm_local_bb0_ld__inst0_readdata),
	.avm_local_bb0_ld__readdatavalid(avm_local_bb0_ld__inst0_readdatavalid),
	.avm_local_bb0_ld__waitrequest(avm_local_bb0_ld__inst0_waitrequest),
	.avm_local_bb0_ld__address(avm_local_bb0_ld__inst0_address),
	.avm_local_bb0_ld__read(avm_local_bb0_ld__inst0_read),
	.avm_local_bb0_ld__write(avm_local_bb0_ld__inst0_write),
	.avm_local_bb0_ld__writeack(avm_local_bb0_ld__inst0_writeack),
	.avm_local_bb0_ld__writedata(avm_local_bb0_ld__inst0_writedata),
	.avm_local_bb0_ld__byteenable(avm_local_bb0_ld__inst0_byteenable),
	.avm_local_bb0_ld__burstcount(avm_local_bb0_ld__inst0_burstcount),
	.profile_lsu_local_bb0_ld__profile_bw_cntl(profile_lsu_local_bb0_ld__profile_bw_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__profile_bw_incr(profile_lsu_local_bb0_ld__profile_bw_incr_inst0_wire_0),
	.profile_lsu_local_bb0_ld__profile_total_ivalid_cntl(profile_lsu_local_bb0_ld__profile_total_ivalid_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl(profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl(profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr(profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr_inst0_wire_0),
	.profile_lsu_local_bb0_ld__profile_avm_stall_cntl(profile_lsu_local_bb0_ld__profile_avm_stall_cntl_inst0_wire_0),
	.avm_local_bb0_ld__u0_enable(avm_local_bb0_ld__u0_inst0_enable),
	.avm_local_bb0_ld__u0_readdata(avm_local_bb0_ld__u0_inst0_readdata),
	.avm_local_bb0_ld__u0_readdatavalid(avm_local_bb0_ld__u0_inst0_readdatavalid),
	.avm_local_bb0_ld__u0_waitrequest(avm_local_bb0_ld__u0_inst0_waitrequest),
	.avm_local_bb0_ld__u0_address(avm_local_bb0_ld__u0_inst0_address),
	.avm_local_bb0_ld__u0_read(avm_local_bb0_ld__u0_inst0_read),
	.avm_local_bb0_ld__u0_write(avm_local_bb0_ld__u0_inst0_write),
	.avm_local_bb0_ld__u0_writeack(avm_local_bb0_ld__u0_inst0_writeack),
	.avm_local_bb0_ld__u0_writedata(avm_local_bb0_ld__u0_inst0_writedata),
	.avm_local_bb0_ld__u0_byteenable(avm_local_bb0_ld__u0_inst0_byteenable),
	.avm_local_bb0_ld__u0_burstcount(avm_local_bb0_ld__u0_inst0_burstcount),
	.profile_lsu_local_bb0_ld__u0_profile_bw_cntl(profile_lsu_local_bb0_ld__u0_profile_bw_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__u0_profile_bw_incr(profile_lsu_local_bb0_ld__u0_profile_bw_incr_inst0_wire_0),
	.profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl(profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl(profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl(profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr(profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr_inst0_wire_0),
	.profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl(profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl_inst0_wire_0),
	.avm_local_bb0_st_add_enable(avm_local_bb0_st_add_inst0_enable),
	.avm_local_bb0_st_add_readdata(avm_local_bb0_st_add_inst0_readdata),
	.avm_local_bb0_st_add_readdatavalid(avm_local_bb0_st_add_inst0_readdatavalid),
	.avm_local_bb0_st_add_waitrequest(avm_local_bb0_st_add_inst0_waitrequest),
	.avm_local_bb0_st_add_address(avm_local_bb0_st_add_inst0_address),
	.avm_local_bb0_st_add_read(avm_local_bb0_st_add_inst0_read),
	.avm_local_bb0_st_add_write(avm_local_bb0_st_add_inst0_write),
	.avm_local_bb0_st_add_writeack(avm_local_bb0_st_add_inst0_writeack),
	.avm_local_bb0_st_add_writedata(avm_local_bb0_st_add_inst0_writedata),
	.avm_local_bb0_st_add_byteenable(avm_local_bb0_st_add_inst0_byteenable),
	.avm_local_bb0_st_add_burstcount(avm_local_bb0_st_add_inst0_burstcount),
	.profile_lsu_local_bb0_st_add_profile_bw_cntl(profile_lsu_local_bb0_st_add_profile_bw_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_st_add_profile_bw_incr(profile_lsu_local_bb0_st_add_profile_bw_incr_inst0_wire_0),
	.profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl(profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl(profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl(profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl_inst0_wire_0),
	.profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr(profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr_inst0_wire_0),
	.profile_lsu_local_bb0_st_add_profile_avm_stall_cntl(profile_lsu_local_bb0_st_add_profile_avm_stall_cntl_inst0_wire_0),
	.clock2x(clock2x),
	.start(start_out),
	.input_x(kernel_arguments_NO_SHIFT_REG[63:0]),
	.input_global_size_0(global_size_NO_SHIFT_REG[0]),
	.input_y(kernel_arguments_NO_SHIFT_REG[127:64]),
	.input_z(kernel_arguments_NO_SHIFT_REG[191:128]),
	.profile_clock(profile_clock_inst0_wire_0),
	.has_a_write_pending(has_a_write_pending),
	.has_a_lsu_active(has_a_lsu_active)
);


assign profile_increment_cntl[0] = profile_lsu_local_bb0_ld__profile_bw_cntl_inst0_wire_0;
assign profile_increment_val[31:0] = profile_lsu_local_bb0_ld__profile_bw_incr_inst0_wire_0;
assign profile_increment_cntl[1] = profile_lsu_local_bb0_ld__profile_total_ivalid_cntl_inst0_wire_0;
assign profile_increment_val[63:32] = 32'h1;
assign profile_increment_cntl[2] = profile_lsu_local_bb0_ld__profile_avm_readwrite_count_cntl_inst0_wire_0;
assign profile_increment_val[95:64] = 32'h1;
assign profile_increment_cntl[3] = profile_lsu_local_bb0_ld__profile_avm_burstcount_total_cntl_inst0_wire_0;
assign profile_increment_val[127:96] = profile_lsu_local_bb0_ld__profile_avm_burstcount_total_incr_inst0_wire_0;
assign profile_increment_cntl[4] = profile_lsu_local_bb0_ld__profile_avm_stall_cntl_inst0_wire_0;
assign profile_increment_val[159:128] = 32'h1;
assign profile_increment_cntl[5] = profile_lsu_local_bb0_ld__u0_profile_bw_cntl_inst0_wire_0;
assign profile_increment_val[191:160] = profile_lsu_local_bb0_ld__u0_profile_bw_incr_inst0_wire_0;
assign profile_increment_cntl[6] = profile_lsu_local_bb0_ld__u0_profile_total_ivalid_cntl_inst0_wire_0;
assign profile_increment_val[223:192] = 32'h1;
assign profile_increment_cntl[7] = profile_lsu_local_bb0_ld__u0_profile_avm_readwrite_count_cntl_inst0_wire_0;
assign profile_increment_val[255:224] = 32'h1;
assign profile_increment_cntl[8] = profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_cntl_inst0_wire_0;
assign profile_increment_val[287:256] = profile_lsu_local_bb0_ld__u0_profile_avm_burstcount_total_incr_inst0_wire_0;
assign profile_increment_cntl[9] = profile_lsu_local_bb0_ld__u0_profile_avm_stall_cntl_inst0_wire_0;
assign profile_increment_val[319:288] = 32'h1;
assign profile_increment_cntl[10] = profile_lsu_local_bb0_st_add_profile_bw_cntl_inst0_wire_0;
assign profile_increment_val[351:320] = profile_lsu_local_bb0_st_add_profile_bw_incr_inst0_wire_0;
assign profile_increment_cntl[11] = profile_lsu_local_bb0_st_add_profile_total_ivalid_cntl_inst0_wire_0;
assign profile_increment_val[383:352] = 32'h1;
assign profile_increment_cntl[12] = profile_lsu_local_bb0_st_add_profile_avm_readwrite_count_cntl_inst0_wire_0;
assign profile_increment_val[415:384] = 32'h1;
assign profile_increment_cntl[13] = profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_cntl_inst0_wire_0;
assign profile_increment_val[447:416] = profile_lsu_local_bb0_st_add_profile_avm_burstcount_total_incr_inst0_wire_0;
assign profile_increment_cntl[14] = profile_lsu_local_bb0_st_add_profile_avm_stall_cntl_inst0_wire_0;
assign profile_increment_val[479:448] = 32'h1;
assign profile_increment_cntl[15] = profile_clock_inst0_wire_0;
assign profile_increment_val[511:480] = 32'h1;
assign profile_increment_cntl[16] = profile_extmem_vector_add_function_bank0_port0_read_data_inc_en;
assign profile_increment_val[543:512] = 32'h1;
assign profile_increment_cntl[17] = profile_extmem_vector_add_function_bank0_port0_read_burst_count_en;
assign profile_increment_val[575:544] = 32'h1;
assign profile_increment_cntl[18] = profile_extmem_vector_add_function_bank0_port0_write_data_inc_en;
assign profile_increment_val[607:576] = 32'h1;
assign profile_increment_cntl[19] = profile_extmem_vector_add_function_bank0_port0_write_burst_count_en;
assign profile_increment_val[639:608] = 32'h1;

endmodule

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// altera message_off 10036
// altera message_off 10230
// altera message_off 10858
module vector_add_sys_cycle_time
	(
		input 		clock,
		input 		resetn,
		output [31:0] 		cur_cycle
	);


 reg [31:0] cur_count_NO_SHIFT_REG;

assign cur_cycle = cur_count_NO_SHIFT_REG;

always @(posedge clock or negedge resetn)
begin
	if (~(resetn))
	begin
		cur_count_NO_SHIFT_REG <= 32'h0;
	end
	else
	begin
		cur_count_NO_SHIFT_REG <= (cur_count_NO_SHIFT_REG + 32'h1);
	end
end

endmodule

