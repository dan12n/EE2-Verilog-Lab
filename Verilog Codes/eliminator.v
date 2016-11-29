module eliminator (out, in, clk, rst);
	input in, clk, rst;
	output out;
	parameter S_A = 4'b0001; S_B = 4'b0010; //Definition of the states
	parameter S_C = 4'b0100; S_D = 4'b1000;
	parameter NSTATE = 4; // Number of states
	reg [NSTATE-1:0] state; //Required as a register of NState
	
	always @ (posedge clk)
		if (rst == 1'b1)
			state <= S_A;
		else 
			case (state)
				S_A: if (in == 1'b1) state <= S_B;
				S_B: if (in == 1'b1) state <= S_C;
				S_C: if (in == 1'b0) state <= S_D;
				S_D: if (in == 1'b1) state <= S_C;
						else state <= S_A;
				default: ; //This does nothing
	
			endcase
	
	always @(*)
		case (state)
			S_A: out = 1'b0;
			S_B: out = 1'b0;
			S_C: out = 1'b1;
			S_D: out = 1'b1;
		endcase
	
endmodule