`timescale 1ns / 1ns // `timescale time_unit/time_precision

module part2(Clock, Reset_b, Data, Function, ALUout);
	input logic Clock;
	input logic Reset_b;
	input logic [3:0] Data; // a
	input logic [1:0] Function;
	output logic [7:0] ALUout; 

	
	always_ff @(posedge Clock) 
		begin 
			if (Reset_b) 
				ALUout <= 8'b00000000; 
			else
				case(Function)
				2'b00: ALUout <= (Data + ALUout[3:0]);
				2'b01: ALUout <= (Data * ALUout[3:0]); 
				2'b10: ALUout <=(ALUout[3:0] << Data);
				endcase
		end
	
endmodule