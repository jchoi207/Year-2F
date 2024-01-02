# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using mux as the top level simulation module
vsim part2

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module

add wave {/*}

# testing function 0 (A+B)




#{ Start
force Clock 1
force Reset_b 1


#######
run 10 ns


force Reset_b 0
force Clock 0
run 10 ns
#} End


force {Function[1]} 0
force {Function[0]} 0



#{
force Clock 1
#######
force {Data[3]} 0 
force {Data[2]} 0
force {Data[1]} 0
force {Data[0]} 1
# ALUout = 0000 + 0001 00000001
run 10 ns





force Clock 0
run 10 ns
#}



#{
force Clock 1
#######
force {Data[3]} 0 
force {Data[2]} 1
force {Data[1]} 0
force {Data[0]} 1
# ALUout = 0101 + 0001 = 00000110
run 10 ns


force {Function[1]} 1
force {Function[0]} 0



#{ Start
force Clock 1
#######
force {Data[3]} 0 
force {Data[2]} 0
force {Data[1]} 1
force {Data[0]} 0
# ALUout = 
run 10 ns


force Clock 0
run 10 ns
#} End





#{ Start
force Clock 1
#######
force {Data[3]} 0 
force {Data[2]} 0
force {Data[1]} 1
force {Data[0]} 0
# ALUout = 
run 10 ns



force Clock 0
run 10 ns
#} End