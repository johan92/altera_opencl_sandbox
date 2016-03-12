vlib work

vlog /home/ish/altera/15.1/quartus/eda/sim_lib/altera_mf.v

vlog -sv ram_models/onchip_ram_256b/onchip_ram_256b.v
vlog -sv ram_models/onchip_ram_256b/submodules/*.v
vlog -sv ram_models/onchip_ram_256b/submodules/*.sv

#vlog -sv altera_src/*.sv
vlog -sv altera_src/*.v

vlog -sv *.sv
vlog -sv *.v

vsim -novopt top_tb

add wave -hex sim:/top_tb/*

delete wave *altsyncram*
delete wave *fifo_component*
delete wave *FAMILY*

run 1000ns
