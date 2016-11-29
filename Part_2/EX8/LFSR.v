//LFSR6
module lfsr6 (data_out, clk, enable);
	output [5:0] data_out;
	input clk, enable;

	reg [5:0] sreg;

	initial sreg = 7'd1;

	always @(posedge clk)
	if (enable == 1'b1)
		sreg <= {sreg[4:0], sreg[0] ^ sreg[5]};
	
	assign data_out = sreg;

endmodule // lfsr6