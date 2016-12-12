module EX8_delay (N, clk, trigger, time_out);
	input [12:0] N;
	input clk, trigger;
	output time_out;
	
	reg [12:0] count;
	reg time_out;
	initial time_out = 1'b0;
	initial count = 13'd0;

	always @ (posedge clk)				begin

		if (trigger == 1'b1) 		begin

			if (count == N -1) 	begin
				count <= 13'd0;
				time_out <= 1; 	end

			else 				
				count <= count + 1;
											end

		else						begin
			time_out <= 0;
			count <= 13'd0;
										end
												end
endmodule