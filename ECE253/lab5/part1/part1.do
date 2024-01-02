# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part1.sv

#load simulation using mux as the top level simulation module
vsim part1

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module

add wave {/*}

# Enable 



#{ Sart
force Enable 1
force -freeze sim:/part1/Clock 1 0, 0 {5 ns} -r 10ns
force Reset 1


#######
run 10 ns


force Reset 0
run 1us