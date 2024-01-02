`timescale 1ns / 1ns

module part1(input logic [2:0] MuxSelect, input logic [6:0] MuxIn , output logic Out);
	always_comb // declare always_comb block begin
	begin
		case (MuxSelect) // start case statement
			3'b000: Out = MuxIn[0];// case 
			3'b001: Out = MuxIn[1];// case 
			3'b010: Out = MuxIn[2];// case 
			3'b011: Out = MuxIn[3];// case 
			3'b100: Out = MuxIn[4];// case 
			3'b101: Out = MuxIn[5];// case 
			3'b110: Out = MuxIn[6];// case 
			default: Out = 1;// default case, set Out = 1 
		endcase 
	end
endmodule
