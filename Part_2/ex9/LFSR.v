//LFSR6
module lfsr6 (data_out, clk, enable);
	output [6:1] data_out;
	input clk, enable;

	reg [6:1] sreg;

	initial sreg = 6'd1;

	always @(posedge clk)
	if (enable == 1'b1)
		sreg <= {sreg[5:1], sreg[1] ^ sreg[6]};
	
	assign data_out = sreg;

endmodule // lfsr6