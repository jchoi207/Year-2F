# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using mux as the top level simulation module
vsim mux2to1

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module


add wave {/*}



force {x} 0, 1 {10 ns} -r {20 ns}
force {y} 0, 1 {20 ns} -r {40 ns}
force {s} 0, 1 {40 ns} -r {80 ns}
run 80 ns