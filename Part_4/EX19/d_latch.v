//D Flip Flop
module d_register (D, en, Q);
	input D, en;
	output Q;
	reg Q;
	
	always @(D)
		Q <= D;
		
endmodule