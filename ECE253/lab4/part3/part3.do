# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part3.sv

#load simulation using mux as the top level simulation module
vsim part3

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module

add wave {/*}

# reset the values

#{ start reset
force clock 1 
force reset 1


run 10 ns

force reset 0 
force clock 0

run 10 ns
#} end reset 
### OUTPUT ### Q = 0000



#{ start 
force clock 1 
force ParallelLoadn 0

force {Data_IN[3]} 0
force {Data_IN[2]} 1
force {Data_IN[1]} 0
force {Data_IN[0]} 1

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 0000



#{ start 
force clock 1 

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 0101



#{ start resring RotateRight
force clock 1 

force ParallelLoadn 1
force RotateRight 1
force ASRight 0

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 1010



#{ start testing ASRight
force clock 1 

force ParallelLoadn 1
force RotateRight 1
force ASRight 1 

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 1101



#{ start testing RotateLeft
force clock 1 

force ParallelLoadn 1
force RotateRight 0
force ASRight 0

run 10 ns


force ParallelLoadn 1
force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 1011




#{ start testing reset on clock = 0 
force clock 1 

run 10 ns

force clock 0
force reset 1

run 10 ns
#} end  
### OUTPUT ### Q = 1011


#{ start testing reset on clock = 0 
force clock 1 

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 1011







#{ start testing reset on clock = 1
force clock 1 
force reset 1

run 10 ns

force clock 0
force reset 0
run 10 ns
#} end  
### OUTPUT ### Q = 0000




#{ start 
force clock 1 
force ParallelLoadn 0

force {Data_IN[3]} 1
force {Data_IN[2]} 0
force {Data_IN[1]} 0
force {Data_IN[0]} 1

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 0101



#{ start testing ASRight
force clock 1 

force ParallelLoadn 1
force RotateRight 1
force ASRight 1 

run 10 ns

force clock 0

run 10 ns
#} end  
### OUTPUT ### Q = 1100
