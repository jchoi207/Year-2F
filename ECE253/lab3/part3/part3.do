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

# testing function 0 (adding)
force {Function[1]} 0 
force {Function[0]} 0

force {A[3]} 1
force {A[2]} 0
force {A[1]} 0
force {A[0]} 0


force {B[3]} 1
force {B[2]} 0
force {B[1]} 0
force {B[0]} 1

run 10 ns




# testing function 1 (or)
force {Function[1]} 0 
force {Function[0]} 1

force {A[3]} 0
force {A[2]} 0
force {A[1]} 0
force {A[0]} 0


force {B[3]} 0
force {B[2]} 0
force {B[1]} 0
force {B[0]} 0

run 10 ns


# testing function 1 (or) ALU = 00000001
force {Function[1]} 0 
force {Function[0]} 1

force {A[3]} 1
force {A[2]} 0
force {A[1]} 0
force {A[0]} 0


force {B[3]} 0
force {B[2]} 0
force {B[1]} 0
force {B[0]} 0

run 10 ns


# testing function 2 (and)
force {Function[1]} 1 
force {Function[0]} 0

force {A[3]} 1
force {A[2]} 1
force {A[1]} 1
force {A[0]} 1


force {B[3]} 1
force {B[2]} 1
force {B[1]} 1
force {B[0]} 0

run 10 ns


# testing function 2 (AND) ALU = 00000001
force {Function[1]} 1 
force {Function[0]} 0

force {A[3]} 1
force {A[2]} 1
force {A[1]} 1
force {A[0]} 1


force {B[3]} 1
force {B[2]} 1
force {B[1]} 1
force {B[0]} 1

run 10 ns











# testing function 3 (concatenation)
force {Function[1]} 1 
force {Function[0]} 1

force {A[3]} 0
force {A[2]} 1
force {A[1]} 0
force {A[0]} 1


force {B[3]} 1
force {B[2]} 0
force {B[1]} 1
force {B[0]} 0

run 10 ns


# testing function 3 (concatenation)
force {Function[1]} 1 
force {Function[0]} 1

force {A[3]} 1
force {A[2]} 0
force {A[1]} 1
force {A[0]} 1


force {B[3]} 1
force {B[2]} 1
force {B[1]} 1
force {B[0]} 0

run 10 ns






