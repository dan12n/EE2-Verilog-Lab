//LFSR13
module lfsr13 (data_out, clk, enable);
	output reg [12:0] data_out;
	input clk, enable;
	reg [12:0] sreg;

	initial sreg = 7'd1;
	initial data_out = 12'd0;
	
	always @(posedge clk)
	if (enable == 1'b1) begin
		sreg 		<= {sreg[11:0], sreg[0] ^ sreg[12]};
	
		data_out 	<= sreg;
	end

endmodule // lfsr13