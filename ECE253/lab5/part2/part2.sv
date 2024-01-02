 `timescale 1ns / 1ns // `timescale time_unit/time_precision


 module part2 #(parameter CLOCK_FREQUENCY = 500)(
	input logic ClockIn, 
	input logic Reset, 
	input logic [1:0] Speed, 
	output logic [3:0] CounterValue
); 
	logic pulse; 
	RateDivider u0(ClockIn, Reset, Speed, pulse); 
	DisplayCounter u1(ClockIn, Reset, pulse, CounterValue); 
endmodule




module RateDivider #(parameter CLOCK_FREQUENCY = 500)( 
	input logic ClockIn, 
	input logic Reset, 
	input logic [1:0] Speed,
	output logic Enable
	);

	logic [$clog2(CLOCK_FREQUENCY*4):0] counter; 
	logic [$clog2(CLOCK_FREQUENCY*4):0] n_cycles; 
	
	always_comb
	begin 
		case(Speed) 
		0: n_cycles =  1'b1; 
		1: n_cycles = CLOCK_FREQUENCY;
		2: n_cycles = CLOCK_FREQUENCY * 2;
		3: n_cycles = CLOCK_FREQUENCY * 4;
		default: n_cycles = 0; 
		endcase
	end 

	always_ff@(posedge ClockIn)
	begin 
		if(Reset)
			counter <= {n_cycles - 1};
		else if(Enable) 
			counter <= {n_cycles - 1}; 
		else 
			counter <= counter - 1;
	end 
	assign Enable = (counter == 1'b0)?'1:'0; 
endmodule



module DisplayCounter (
	input logic Clock, Reset, EnableDC,
	output logic [3:0] CounterValue
);	

		always_ff@(posedge Clock)
		begin 
			if(Reset) 
				CounterValue <= {1'b0000}; 
			else if (EnableDC)
				CounterValue <= CounterValue + 1; 
		end 

endmodule 