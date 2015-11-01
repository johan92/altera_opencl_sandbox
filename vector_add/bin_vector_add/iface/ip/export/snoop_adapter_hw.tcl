# TCL File Generated by Component Editor 10.0
# Mon Apr 25 23:22:07 EDT 2011
# DO NOT MODIFY


# +-----------------------------------
# | 
# | snoop_adapter "Avalon Snoop Adapter" v10.0
# | John Freeman 2011.04.25.23:22:07
# | Emit a streaming interface of writes made through this master
# | 
# | /data/jfreeman/opencl/pcie_partition/ip/export/snoop_adapter.v
# | 
# |    ./snoop_adapter.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 10.0
# | 
package require -exact sopc 10.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module snoop_adapter
# | 
set_module_property DESCRIPTION "Generate a streaming interface for snooped writes"
set_module_property NAME acl_snoop_adapter
set_module_property VERSION 11.0
set_module_property GROUP "ACL Internal Components"
set_module_property AUTHOR "Altera OpenCL"
set_module_property DISPLAY_NAME "Avalon Snoop Adapter"
set_module_property TOP_LEVEL_HDL_FILE snoop_adapter.v
set_module_property TOP_LEVEL_HDL_MODULE snoop_adapter
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ELABORATION_CALLBACK elaborate
set_module_property VALIDATION_CALLBACK validate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file snoop_adapter.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter NUM_BYTES INTEGER 4
set_parameter_property NUM_BYTES DEFAULT_VALUE 4
set_parameter_property NUM_BYTES DISPLAY_NAME "Data Width"
set_parameter_property NUM_BYTES UNITS "bytes"
set_parameter_property NUM_BYTES ALLOWED_RANGES {1 2 4 8 16 32 64 128}
set_parameter_property NUM_BYTES AFFECTS_ELABORATION true
set_parameter_property NUM_BYTES HDL_PARAMETER true

add_parameter DATA_WIDTH INTEGER 32
set_parameter_property DATA_WIDTH DEFAULT_VALUE 32
set_parameter_property DATA_WIDTH DISPLAY_NAME "Data Width"
set_parameter_property DATA_WIDTH UNITS "bits"
set_parameter_property DATA_WIDTH HDL_PARAMETER false
set_parameter_property DATA_WIDTH DERIVED true

add_parameter BYTE_ADDRESS_WIDTH INTEGER 12
set_parameter_property BYTE_ADDRESS_WIDTH DEFAULT_VALUE 12
set_parameter_property BYTE_ADDRESS_WIDTH DISPLAY_NAME "Byte address width"
set_parameter_property BYTE_ADDRESS_WIDTH UNITS "bits"
set_parameter_property BYTE_ADDRESS_WIDTH HDL_PARAMETER true
set_parameter_property BYTE_ADDRESS_WIDTH AFFECTS_ELABORATION true
#set_parameter_property BYTE_ADDRESS_WIDTH SYSTEM_INFO {ADDRESS_WIDTH m1}

add_parameter WORD_ADDRESS_WIDTH INTEGER 12
set_parameter_property WORD_ADDRESS_WIDTH DEFAULT_VALUE 12
set_parameter_property WORD_ADDRESS_WIDTH DISPLAY_NAME "Word address width"
set_parameter_property WORD_ADDRESS_WIDTH UNITS "bits"
set_parameter_property WORD_ADDRESS_WIDTH HDL_PARAMETER true
set_parameter_property WORD_ADDRESS_WIDTH DERIVED true

add_parameter PENDING_READS INTEGER 1
set_parameter_property PENDING_READS DEFAULT_VALUE 1
set_parameter_property PENDING_READS DISPLAY_NAME "Max Pending Reads"
set_parameter_property PENDING_READS UNITS None
set_parameter_property PENDING_READS ALLOWED_RANGES 1:256
set_parameter_property PENDING_READS AFFECTS_ELABORATION true
set_parameter_property PENDING_READS HDL_PARAMETER false

add_parameter BURSTCOUNT_WIDTH INTEGER 1
set_parameter_property BURSTCOUNT_WIDTH DEFAULT_VALUE 1
set_parameter_property BURSTCOUNT_WIDTH DISPLAY_NAME "Burstcount Width"
set_parameter_property BURSTCOUNT_WIDTH UNITS ""
set_parameter_property BURSTCOUNT_WIDTH ALLOWED_RANGES 1:10
set_parameter_property BURSTCOUNT_WIDTH AFFECTS_ELABORATION true
set_parameter_property BURSTCOUNT_WIDTH HDL_PARAMETER true

# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clk
# | 
add_interface clk clock end
set_interface_property clk ENABLED true
add_interface_port clk clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clk_reset
# | 
add_interface clk_reset reset end
set_interface_property clk_reset associatedClock clk
set_interface_property clk_reset synchronousEdges DEASSERT
set_interface_property clk_reset ENABLED true
add_interface_port clk_reset reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point kernel_clk
# | 
add_interface kernel_clk clock end
set_interface_property kernel_clk ENABLED true
add_interface_port kernel_clk kernel_clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point kernel_reset
# | 
add_interface kernel_reset reset end
set_interface_property kernel_reset associatedClock kernel_clk
set_interface_property kernel_reset synchronousEdges DEASSERT
set_interface_property kernel_reset ENABLED true
add_interface_port kernel_reset kernel_reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point s1
# | 
add_interface s1 avalon end
set_interface_property s1 addressAlignment DYNAMIC
set_interface_property s1 bridgesToMaster ""
set_interface_property s1 associatedClock clk
set_interface_property s1 associatedReset clk_reset
set_interface_property s1 burstOnBurstBoundariesOnly false
set_interface_property s1 explicitAddressSpan 0
set_interface_property s1 holdTime 0
set_interface_property s1 isMemoryDevice false
set_interface_property s1 isNonVolatileStorage false
set_interface_property s1 linewrapBursts false
set_interface_property s1 printableDevice false
set_interface_property s1 readLatency 0
set_interface_property s1 readWaitTime 0
set_interface_property s1 setupTime 0
set_interface_property s1 timingUnits cycles
set_interface_property s1 writeWaitTime 0
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point master
# | 
add_interface m1 avalon start
set_interface_property m1 ENABLED true
set_interface_property m1 associatedClock clk
set_interface_property m1 associatedReset clk_reset
set_interface_property m1 burstOnBurstBoundariesOnly false
set_interface_property m1 doStreamReads false
set_interface_property m1 doStreamWrites false
set_interface_property m1 linewrapBursts false
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point snoop
# | 
#add_interface snoop conduit end
add_interface snoop avalon_streaming start
set_interface_property snoop associatedClock kernel_clk 
set_interface_property snoop associatedReset clk_reset
set_interface_property snoop errorDescriptor ""
set_interface_property snoop firstSymbolInHighOrderBits true
set_interface_property snoop maxChannel 0
set_interface_property snoop readyLatency 0
set_interface_property snoop ENABLED true
add_interface_port snoop snoop_data data Output 1+WORD_ADDRESS_WIDTH+BURSTCOUNT_WIDTH
add_interface_port snoop snoop_valid valid Output 1
add_interface_port snoop snoop_ready ready Input 1
# | 
# +-----------------------------------

proc elaborate {} {
    set num_bytes [ get_parameter_value NUM_BYTES ]
    set byte_address_width [ get_parameter_value BYTE_ADDRESS_WIDTH ]
    set word_address_width [ get_parameter_value WORD_ADDRESS_WIDTH ]
    set data_width [ get_parameter_value DATA_WIDTH ]
    set pending_reads [ get_parameter_value PENDING_READS ]
    set burstcount_width [ get_parameter_value BURSTCOUNT_WIDTH ]
    set snoop_width [ expr 1 + $word_address_width + $burstcount_width ]

    set_interface_property snoop dataBitsPerSymbol $snoop_width

    # +-----------------------------------
    # | connection point s1
    # | 
    add_interface_port s1 read read Input 1
    add_interface_port s1 readdata readdata Output $data_width
    add_interface_port s1 readdatavalid readdatavalid Output 1
    add_interface_port s1 write write Input 1
    add_interface_port s1 writedata writedata Input $data_width
    add_interface_port s1 burstcount burstcount Input $burstcount_width
    add_interface_port s1 burstbegin beginbursttransfer Input 1
    add_interface_port s1 byteenable byteenable Input $num_bytes
    add_interface_port s1 address address Input $word_address_width
    add_interface_port s1 waitrequest waitrequest output 1

    set_interface_property s1 maximumPendingReadTransactions $pending_reads
    # | 
    # +-----------------------------------

    # +-----------------------------------
    # | connection point m1
    # | 
    add_interface_port m1 export_address address Output $byte_address_width
    add_interface_port m1 export_read read Output 1
    add_interface_port m1 export_readdata readdata Input $data_width
    add_interface_port m1 export_readdatavalid readdatavalid Input 1
    add_interface_port m1 export_write write Output 1
    add_interface_port m1 export_writedata writedata Output $data_width
    add_interface_port m1 export_burstcount burstcount Output $burstcount_width
    #add_interface_port m1 export_burstbegin burstbegin Output 1
    add_interface_port m1 export_byteenable byteenable Output $num_bytes
    add_interface_port m1 export_waitrequest waitrequest Input 1
    # | 
    # +-----------------------------------

    # +-----------------------------------
    # | connection point snoop
    # | 
    #add_interface_port snoop snoop_data export Output $snoop_width
    #add_interface_port snoop snoop_valid export Output 1
    #add_interface_port snoop snoop_ready export Input 1
    add_interface_port snoop snoop_data data Output $snoop_width
    add_interface_port snoop snoop_valid valid Output 1
    add_interface_port snoop snoop_ready ready Input 1
    # | 
    # +-----------------------------------

}

proc validate {} {
    set num_bytes [ get_parameter_value NUM_BYTES ]
    set address_range [ get_parameter_value BYTE_ADDRESS_WIDTH ]
    set addr_span [ expr $address_range * 1 ]
    set word_address_width [ expr int ( $addr_span - ceil (log ($num_bytes) / (log(2)))) ]

    set_parameter_value DATA_WIDTH [ expr $num_bytes * 8 ]
    set_parameter_value WORD_ADDRESS_WIDTH $word_address_width
}
