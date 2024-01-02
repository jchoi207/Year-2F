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
add wave -position insertpoint  \
sim:/part2/D0/a \
sim:/part2/D0/b \
sim:/part2/D0/c \
sim:/part2/D0/x
add wave -position insertpoint  \
sim:/part2/D0/alu_out \
sim:/part2/D0/alu_a \
sim:/part2/D0/alu_b






#{ Start
force Clock 1
force Reset 1
run 10 ns
force Clock 0
run 10 ns
#} End




## loading A
#{ Start
force Clock 1
force Reset 0
force Go 1
force DataIn 00000111
run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force Go 0
run 10 ns
force Clock 0
run 10 ns
#} End







## loading B
#{ Start
force Clock 1
force Go 1
force DataIn 00000010

run 10 ns
force Clock 0
run 10 ns
#} End



#{ Start
force Clock 1
force Go 0
run 10 ns
force Clock 0
run 10 ns
#} End




## loading C
#{ Start
force Clock 1
force Go 1
force DataIn 00001011

run 10 ns
force Clock 0
run 10 ns
#} End




#{ Start
force Clock 1
force Go 0
run 10 ns
force Clock 0
run 10 ns
#} End






## loading x
#{ Start
force Clock 1
force Go 1
force DataIn 00000011

run 10 ns
force Clock 0
run 10 ns
#} End


#{ Start
force Clock 1
force Go 0
run 10 ns
force Clock 0
run 10 ns
#} End


# 4 * 3 =12

# A = 1
# B = 7
# C = 1 
# x = 2




#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

#{ Start
force Clock 1
force Go 0

run 10 ns
force Clock 0
run 10 ns
#} End

