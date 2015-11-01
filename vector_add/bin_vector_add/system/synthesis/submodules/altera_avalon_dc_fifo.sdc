# $File: //acds/rel/14.1/ip/sopc/components/altera_avalon_dc_fifo/altera_avalon_dc_fifo.sdc $
# $Revision: #2 $
# $Date: 2014/10/24 $
# $Author: jyeap $
#-------------------------------------------------------------------------------
# TimeQuest constraints to constrain the timing across asynchronous clock domain crossings.
# The idea is to minimize skew to less than one clock period to keep the gray encoding, 
# and to minimize latency on the pointer crossings.
#
# Do not declare the FIFO clocks as asynchronous at the top level, or false path these crossings,
# because that will override these constraints.
#
# The paths are from the Gray Code read and write pointers to their respective synchronizer banks.

set_max_delay -from [get_registers {*|in_wr_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] 100
set_min_delay -from [get_registers {*|in_wr_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] -100
set_net_delay -max 2 -from [get_pins -compatibility_mode {*|in_wr_ptr_gray[*]*}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] 
set_net_delay -min 0 -from [get_pins -compatibility_mode {*|in_wr_ptr_gray[*]*}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]
#set_max_skew 1.5 -from [get_registers {*|in_wr_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:write_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]

set_max_delay -from [get_registers {*|out_rd_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] 100
set_min_delay -from [get_registers {*|out_rd_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}] -100
set_net_delay -max 2 -from [get_pins -compatibility_mode {*|out_rd_ptr_gray[*]*}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]
set_net_delay -min 0 -from [get_pins -compatibility_mode {*|out_rd_ptr_gray[*]*}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]
#set_max_skew 1.5 -from [get_registers {*|out_rd_ptr_gray[*]}] -to [get_registers {*|altera_dcfifo_synchronizer_bundle:read_crosser|altera_std_synchronizer_nocut:sync[*].u|din_s1}]


# add in timing constraints across asynchronous clock domain crossings for simple dual clock memory inference

set mem_regs [get_registers -nowarn *|altera_avalon_dc_fifo:*|mem*];
if {![llength [query_collection -report -all $mem_regs]] > 0} {
	set mem_regs [get_registers -nowarn altera_avalon_dc_fifo:*|mem*];
}
set internal_out_payload_regs [get_registers -nowarn *|altera_avalon_dc_fifo:*|internal_out_payload*];
if {![llength [query_collection -report -all $internal_out_payload_regs]] > 0} {
	set internal_out_payload_regs [get_registers -nowarn altera_avalon_dc_fifo:*|internal_out_payload*];
}
if {[llength [query_collection -report -all $internal_out_payload_regs]] > 0 && [llength [query_collection -report -all $mem_regs]] > 0} {
        set_max_delay -from $mem_regs -to $internal_out_payload_regs 100
        set_min_delay -from $mem_regs -to $internal_out_payload_regs -100
        set_net_delay -max 2 -from $mem_regs -to $internal_out_payload_regs
        set_net_delay -min 0 -from $mem_regs -to $internal_out_payload_regs
        #set_max_skew 2 -from $mem_regs -to $internal_out_payload_regs
}

