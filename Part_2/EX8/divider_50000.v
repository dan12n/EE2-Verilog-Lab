//Clock divider
module divider_50000 (clk, out_clk);
	input clk;
	output out_clk;
	parameter max_value = 50000;
	reg [15:0] count;
	reg out_clk;

	initial out_clk = 1'b0;
	
	//Sends a clock pulse lasting one clock cycle when count is zero, restarts by setting count to max value
	always @(posedge clk)
	if (count == 10'b0) begin
		out_clk <= 1'b1;
		count <= max_value;
		end
		
	else begin
		count <= count - 1'b1;
		out_clk <= 1'b0;
	end
endmodule // divider_50000