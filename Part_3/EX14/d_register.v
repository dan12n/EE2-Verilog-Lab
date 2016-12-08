module d_register (D, clk, Q);
	input [9:0] D;
	output [9:0] Q;
	input clk;
	
	reg[9:0] Q;
	
	always @(posedge clk)
		Q <= D;
endmodule