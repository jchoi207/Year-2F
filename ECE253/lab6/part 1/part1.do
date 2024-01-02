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


#{ Start
force Clock 1
force Reset 1
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force Reset 0
force w 1 
# A -> B
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force w 1
# B -> C
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force w 1
# C -> D
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# D -> F
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# F -> F
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 0
# F -> E
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# E -> G
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# G -> C
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 0
# C -> E
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# E -> G
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# G -> C
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# C -> D
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# F
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force Reset 1
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force Reset 0
force w 1 
# A -> B
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force w 1
# B -> C
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force w 1
# C -> D
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# D -> F
run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force w 1
# F -> F
run 10 ns
force Clock 0
run 10 ns
#} End

run 100 ns