//LFSR
module lfsr4 (data_out, clk);
	output [4:1] data_out;
	input clk;

	reg [4:1] sreg;

	initial sreg = 4'b1;

	always @(posedge clk)
		sreg <= {sreg[3:1], sreg[4] ^ sreg[3]};

	assign data_out = sreg;

endmodule // lfsr4



//LFSR
module lfsr7 (data_out, clk);
	output [7:1] data_out;
	input clk;

	reg [7:1] sreg;

	initial sreg = 4'b1;

	always @(posedge clk)
		sreg <= {sreg[6:1], sreg[1] ^ sreg[7]};

	assign data_out = sreg;

endmodule // lfsr7


0 0 0 0 0 0 1
0 0 0 0 0 1 1
0 0 0 0 1 1 1
0 0 0 1 1 1 1
0 0 1 1 1 1 1
0 1 1 1 1 1 1
1 1 1 1 1 1 1
1 1 1 1 1 1 0
1 1 1 1 1 0 1
1 1 1 1 0 1 0
