# TCL File Generated by Component Editor 11.0
# Tue Jul 19 13:15:52 PDT 2011


# +-----------------------------------
# | 
# | uniphy_status "ACL Pipelined MM Bridge" v1.0
# | Altera OpenCL 2011.07.19.13:15:52
# | Pipelined clock crossing splitter
# | 
# | 
# |    ./uniphy_status.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 11.0
# | 
package require -exact sopc 10.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module uniphy_status
# | 
set_module_property DESCRIPTION "Aggregates Uniphy status conduit into a slave (success returns 0)"
set_module_property NAME uniphy_status
set_module_property VERSION 10.0
set_module_property GROUP "ACL Internal Components"
set_module_property AUTHOR "Altera OpenCL"
set_module_property DISPLAY_NAME "ACL Uniphy status to AVS"
set_module_property TOP_LEVEL_HDL_FILE uniphy_status.v
set_module_property TOP_LEVEL_HDL_MODULE uniphy_status
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property ANALYZE_HDL false
set_module_property ELABORATION_CALLBACK elaborate
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file uniphy_status.v {SYNTHESIS SIMULATION}
add_file uniphy_status.sdc {SDC}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter WIDTH INTEGER 32
set_parameter_property WIDTH DEFAULT_VALUE 32
set_parameter_property WIDTH DISPLAY_NAME "Slave Width"
set_parameter_property WIDTH UNITS "bits" 
set_parameter_property WIDTH AFFECTS_ELABORATION true
set_parameter_property WIDTH HDL_PARAMETER true

add_parameter NUM_UNIPHYS INTEGER 2
set_parameter_property NUM_UNIPHYS DEFAULT_VALUE 2
set_parameter_property NUM_UNIPHYS DISPLAY_NAME "Number of Uniphy status interfaces"
set_parameter_property NUM_UNIPHYS AFFECTS_ELABORATION true
set_parameter_property NUM_UNIPHYS HDL_PARAMETER true

proc elaborate {} {
  set num_uniphys [ get_parameter_value NUM_UNIPHYS ]

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
  add_interface_port clk_reset resetn reset_n Input 1
  # | 
  # +-----------------------------------

  if { $num_uniphys >= 1 } {
    # +-----------------------------------
    # | connection point uniphy mem0_status
    # | 
    add_interface mem0_status conduit end
    set_interface_property mem0_status ENABLED true
    add_interface_port mem0_status mem0_local_init_done local_init_done Input 1
    add_interface_port mem0_status mem0_local_cal_success local_cal_success Input 1
    add_interface_port mem0_status mem0_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 2 } {
    # +-----------------------------------
    # | connection point uniphy mem1_status
    # | 
    add_interface mem1_status conduit end
    set_interface_property mem1_status ENABLED true
    add_interface_port mem1_status mem1_local_init_done local_init_done Input 1
    add_interface_port mem1_status mem1_local_cal_success local_cal_success Input 1
    add_interface_port mem1_status mem1_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 3 } {

    # +-----------------------------------
    # | connection point uniphy mem2_status
    # | 
    add_interface mem2_status conduit end
    set_interface_property mem2_status ENABLED true
    add_interface_port mem2_status mem2_local_init_done local_init_done Input 1
    add_interface_port mem2_status mem2_local_cal_success local_cal_success Input 1
    add_interface_port mem2_status mem2_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 4 } {

    # +-----------------------------------
    # | connection point uniphy mem3_status
    # | 
    add_interface mem3_status conduit end
    set_interface_property mem3_status ENABLED true
    add_interface_port mem3_status mem3_local_init_done local_init_done Input 1
    add_interface_port mem3_status mem3_local_cal_success local_cal_success Input 1
    add_interface_port mem3_status mem3_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 5 } {

    # +-----------------------------------
    # | connection point uniphy mem4_status
    # | 
    add_interface mem4_status conduit end
    set_interface_property mem4_status ENABLED true
    add_interface_port mem4_status mem4_local_init_done local_init_done Input 1
    add_interface_port mem4_status mem4_local_cal_success local_cal_success Input 1
    add_interface_port mem4_status mem4_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 6 } {

    # +-----------------------------------
    # | connection point uniphy mem5_status
    # | 
    add_interface mem5_status conduit end
    set_interface_property mem5_status ENABLED true
    add_interface_port mem5_status mem5_local_init_done local_init_done Input 1
    add_interface_port mem5_status mem5_local_cal_success local_cal_success Input 1
    add_interface_port mem5_status mem5_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 7 } {

    # +-----------------------------------
    # | connection point uniphy mem6_status
    # | 
    add_interface mem6_status conduit end
    set_interface_property mem6_status ENABLED true
    add_interface_port mem6_status mem6_local_init_done local_init_done Input 1
    add_interface_port mem6_status mem6_local_cal_success local_cal_success Input 1
    add_interface_port mem6_status mem6_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  if { $num_uniphys >= 8 } {

    # +-----------------------------------
    # | connection point uniphy mem7_status
    # | 
    add_interface mem7_status conduit end
    set_interface_property mem7_status ENABLED true
    add_interface_port mem7_status mem7_local_init_done local_init_done Input 1
    add_interface_port mem7_status mem7_local_cal_success local_cal_success Input 1
    add_interface_port mem7_status mem7_local_cal_fail local_cal_fail Input 1
    # | 
    # +-----------------------------------
  }

  # +-----------------------------------
  # | connection point uniphy status
  # | 
  add_interface status_export conduit start
  set_interface_property status_export ENABLED true
  add_interface_port status_export export_local_init_done local_init_done Output 1
  add_interface_port status_export export_local_cal_success local_cal_success Output 1
  add_interface_port status_export export_local_cal_fail local_cal_fail Output 1
  # | 
  # +-----------------------------------


  # +-----------------------------------
  # | connection point s
  # | 
  add_interface s avalon end
  set_interface_property s addressAlignment DYNAMIC
  set_interface_property s addressUnits WORDS
  set_interface_property s associatedClock clk
  set_interface_property s associatedReset clk_reset
  set_interface_property s burstOnBurstBoundariesOnly false
  set_interface_property s explicitAddressSpan 0
  set_interface_property s holdTime 0
  set_interface_property s isMemoryDevice false
  set_interface_property s isNonVolatileStorage false
  set_interface_property s linewrapBursts false
  set_interface_property s printableDevice false
  set_interface_property s setupTime 0
  set_interface_property s timingUnits Cycles
  set_interface_property s ENABLED true

  add_interface_port s slave_read read Input 1
  add_interface_port s slave_readdata readdata Output WIDTH
  # | 
  # +-----------------------------------
}
