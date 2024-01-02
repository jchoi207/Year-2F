`timescale 1ns / 1ns // `timescale time_unit/time_precision

module part2(A, B, Function, ALUout);
	input logic [3:0] A, B;
	input logic [1:0] Function;
	output logic [7:0] ALUout; 
	wire [3:0] ripple_sum_4;
	wire [3:0] carry_out; 
	
	ripple_adder_4 function_1(.a(A), .b(B), .c_in(0), .s(ripple_sum_4[3:0]), .c_out(carry_out[3:0]));
	// instantiate the ripple adder for case 0 ?
	always_comb
	begin 
		case(Function)
			0: ALUout = {3'b000, carry_out[3] ,ripple_sum_4[3:0]};
			1: ALUout = {7'b0000000, |{A , B}};
			2: ALUout = {7'b0000000, &{A , B}};
			3: ALUout = {A[3:0] , B[3:0]};
			default: ALUout = 8'b11111111;
		endcase
	end
endmodule 

module ripple_adder_4(input logic [3:0] a, b, input logic c_in,
             output logic [3:0] s, c_out);

	 
	FA u0(c_in, a[0], b[0], s[0], c_out[0]);
	FA u1(c_out[0], a[1], b[1], s[1], c_out[1]);
	FA u2(c_out[1], a[2], b[2], s[2], c_out[2]);
	FA u3(c_out[2], a[3], b[3], s[3], c_out[3]);
	
endmodule

module FA(input logic ci, a, b, 
		  output logic s, co);
		  
			assign s = (a ^ b) ^ ci;
			assign co = ~(a ^ b) & b | (a ^ b) & ci;
endmodule 