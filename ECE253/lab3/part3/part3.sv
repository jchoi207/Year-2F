`timescale 1ns / 1ns // `timescale time_unit/time_precision



module part3(A, B, Function, ALUout);
	
	parameter N = 4; 
	input logic [N-1:0] A, B;
	input logic [1:0] Function;
	output logic [2*N-1:0] ALUout; 
	
	// assign ALUout[2*N-1:1] = 0;
	always_comb
	begin 
		case(Function)
			0: ALUout = A + B;
		
			1: begin 
			ALUout[2*N-1:1] = 0;
			ALUout[0] = |{A , B};
			end
			
			2: begin
			ALUout[2*N-1:1] = 0;
			ALUout[0] = &{A , B};
			end
			
			3: ALUout = {A[N-1:0] , B[N-1:0]}; // both A and B are the same size
			
			// default: ALUout = 2'bz;
		endcase
	end
endmodule 

