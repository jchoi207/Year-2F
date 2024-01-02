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


# 0
force {MuxSelect[0]} 0
force {MuxSelect[1]} 0
force {MuxSelect[2]} 0

force {MuxIn[0]} 1
force {MuxIn[1]} 0
force {MuxIn[2]} 0
force {MuxIn[3]} 0
force {MuxIn[4]} 0
force {MuxIn[5]} 0
force {MuxIn[6]} 0

run 10 ns 

# Scenario 1
force {MuxSelect[0]} 1
force {MuxSelect[1]} 0
force {MuxSelect[2]} 0

force {MuxIn[0]} 0
force {MuxIn[1]} 1
force {MuxIn[2]} 0
force {MuxIn[3]} 0
force {MuxIn[4]} 0
force {MuxIn[5]} 0
force {MuxIn[6]} 0

run 10 ns

# Scenario 2
force {MuxSelect[0]} 0
force {MuxSelect[1]} 1
force {MuxSelect[2]} 0

force {MuxIn[0]} 0
force {MuxIn[1]} 0
force {MuxIn[2]} 1
force {MuxIn[3]} 0
force {MuxIn[4]} 0
force {MuxIn[5]} 0
force {MuxIn[6]} 0

run 10 ns

# Scenario 3
force {MuxSelect[0]} 1
force {MuxSelect[1]} 1
force {MuxSelect[2]} 0

force {MuxIn[0]} 0
force {MuxIn[1]} 0
force {MuxIn[2]} 0
force {MuxIn[3]} 1
force {MuxIn[4]} 0
force {MuxIn[5]} 0
force {MuxIn[6]} 0

run 10 ns

# Scenario 4
force {MuxSelect[0]} 0
force {MuxSelect[1]} 0
force {MuxSelect[2]} 1

force {MuxIn[0]} 0
force {MuxIn[1]} 0
force {MuxIn[2]} 0
force {MuxIn[3]} 0
force {MuxIn[4]} 1
force {MuxIn[5]} 0
force {MuxIn[6]} 0

run 10 ns

# Scenario 5
force {MuxSelect[0]} 1
force {MuxSelect[1]} 0
force {MuxSelect[2]} 1

force {MuxIn[0]} 0
force {MuxIn[1]} 0
force {MuxIn[2]} 0
force {MuxIn[3]} 0
force {MuxIn[4]} 0
force {MuxIn[5]} 1
force {MuxIn[6]} 0

run 10 ns

# Scenario 6
force {MuxSelect[0]} 0
force {MuxSelect[1]} 1
force {MuxSelect[2]} 1

force {MuxIn[0]} 0
force {MuxIn[1]} 0
force {MuxIn[2]} 0
force {MuxIn[3]} 0
force {MuxIn[4]} 0
force {MuxIn[5]} 0
force {MuxIn[6]} 1

run 10 ns

# Scenario 7 DEFAULT
force {MuxSelect[0]} 1
force {MuxSelect[1]} 1
force {MuxSelect[2]} 1


run 10 ns

