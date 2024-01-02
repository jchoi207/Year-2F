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

# testing function 0 (adding)
force {c_in} 0

force {a[3]} 1
force {a[2]} 0
force {a[1]} 0
force {a[0]} 0


force {b[3]} 1
force {b[2]} 0
force {b[1]} 0
force {b[0]} 1

run 10 ns

