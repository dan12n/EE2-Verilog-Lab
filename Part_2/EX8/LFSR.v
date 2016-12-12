//LFSR13
module lfsr13 (data_out, clk, enable);
	output reg [13:0] data_out;
	input clk, enable;
	reg [5:0] sreg;
	wire constant = 8'd250;

	initial sreg = 6'd1;
	initial data_out = 13'd0;
	
	always @(posedge clk)
	if (enable == 1'b1) begin
		sreg 		<= {sreg[4:0], sreg[0] ^ sreg[5]};
	
		data_out 	<= sreg*constant;
	end

endmodule // lfsr13
