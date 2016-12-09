//Clock divider
module divider_2500 (enable, clk, out_clk);
	input clk, enable;
	output out_clk;
	parameter max_value = 999;
	reg [15:0] count;
	reg out_clk;

	initial out_clk = 1'b0;
	
	always @(posedge clk)
	if (enable == 1'b1) begin
	
		if (count == 10'b0) begin
			out_clk <= 1'b1;
			count <= max_value;
			end
			
		else begin
			count <= count - 1'b1;
			out_clk <= 1'b0;
		end
	
	end
endmodule // divider_2500