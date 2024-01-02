`timescale 1ns / 1ns // `timescale time_unit/time_precision


module part1 (
	input logic Clock,
	input logic Enable,
	input logic Reset,
	output logic [7:0] CounterValue
	);
	wire T0 = Enable;
	wire T1 = T0 & CounterValue[0];
	wire T2 = T1 & CounterValue[1];
 	wire T3 = T2 & CounterValue[2];
	wire T4 = T3 & CounterValue[3];
	wire T5 = T4 & CounterValue[4];
	wire T6 = T5 & CounterValue[5];
	wire T7 = T6 & CounterValue[6]; 

	tee_ff u0(Clock, Enable, Reset, CounterValue[0]);
	tee_ff u1(Clock, T1, Reset, CounterValue[1]);
 	tee_ff u2(Clock, T2, Reset, CounterValue[2]);
	tee_ff u3(Clock, T3, Reset, CounterValue[3]);
	tee_ff u4(Clock, T4, Reset, CounterValue[4]);
	tee_ff u5(Clock, T5, Reset, CounterValue[5]);
	tee_ff u6(Clock, T6, Reset, CounterValue[6]);
	tee_ff u7(Clock, T7, Reset, CounterValue[7]); 

endmodule 


module tee_ff(Clock, T, Reset, Q);
	input logic Clock, T, Reset;
	output logic Q;
	
	always_ff@(posedge Clock)
		begin 
			if (Reset)
				Q <= 1'b0;
			else
				Q <= Q ^ T;
		end
endmodule