`timescale 1ns / 1ns // `timescale time_unit/time_precision
module part1(input logic [3:0] a, b, input logic c_in,
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