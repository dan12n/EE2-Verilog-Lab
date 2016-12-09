//LFSR13
module lfsr13 (data_out, clk, enable);
	output [12:0] data_out;
	input clk, enable;

	reg [12:0] sreg;

	initial sreg = 7'd1;

	always @(posedge clk)
	if (enable == 1'b1)
		sreg <= {sreg[11:0], sreg[0] ^ sreg[12]};
	
	assign data_out = sreg;

endmodule // lfsr13