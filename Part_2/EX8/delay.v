module EX8_delay (N, clk, trigger, time_out);
	input [12:0] N;
	input clk, trigger;
	output time_out;
	
	reg [12:0] count;
	reg time_out;
	initial time_out = 1'b0;
	initial count = 12'b0;

	always @ (posedge clk)
		if (trigger == 1'b1) begin
				if (count == N -1) begin
					count <= 12'b0;
					time_out <= 1; end
				else 
					count <= count + 1;
		end

endmodule