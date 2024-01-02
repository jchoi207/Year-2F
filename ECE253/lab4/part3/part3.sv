`timescale 1ns / 1ns // `timescale time_unit/time_precision

module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
	input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
	input logic [3:0] Data_IN;
	output logic [3:0] Q;
	
	logic [3:0] current_register;
	logic [3:0] next_register;

	
	D_flip_flop u3(clock, reset, Data_IN[3], next_register[3]);
	D_flip_flop u2(clock, reset, Data_IN[2], next_register[2]);
	D_flip_flop u1(clock, reset, Data_IN[1], next_register[1]);
	D_flip_flop u0(clock, reset, Data_IN[0], next_register[0]);
	
	always_ff @(posedge clock) begin
		if (reset) begin 
			current_register <= 4'b0;
			next_register <= 4'b0;
		end else if (ParallelLoadn == 0) begin
			current_register <= Data_IN;
		end else begin 
		
			if (RotateRight && ASRight) begin 
				next_register[3:0] = {current_register[3], current_register[3:1]};
				current_register = next_register;
			end else if (RotateRight) begin
				next_register[3:0] = {current_register[0], current_register[3:1]};
				current_register = next_register;

			end else begin
				next_register[3:0] = {current_register[2:0], current_register[3]};
				current_register = next_register;
			end 
		end
	end 
	
	assign Q = next_register;
endmodule






module D_flip_flop(input logic clk,
input logic reset_b, 
input logic d, 
output logic q);

	always_ff @(posedge clk) 
	begin
	if (reset_b) 
		q <= 1'b0;
	else q <= d;
	end
endmodule