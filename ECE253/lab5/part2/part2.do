vlib work
vlog part2.sv
vsim part2
log {/*}
add wave {/*}






# Enable 

force ClockIn 1
force Reset 1
force {Speed[1]} 1
force {Speed[0]} 0
run 5 ns

force Reset 0
force ClockIn 0

run 5 ns


#{ Sart



force -freeze sim:/part2/ClockIn 1 0, 0 {5 ns} -r 10ns



#######
run 10 ns


run 200 ns


