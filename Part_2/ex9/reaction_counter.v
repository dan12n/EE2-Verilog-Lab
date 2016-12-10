module reaction_counter (en_reaction_counter, clk_div_2500, KEY0, reaction_time);
	input en_reaction_counter, clk_div_2500, KEY0;
	output [15:0] reaction_time;

	reg [15:0] count;
	
	reg[15:0] reaction_time;

	initial count = 16'b0;
	initial reaction_time = 16'b0;

	always @(posedge clk_div_2500) 			begin
		if (en_reaction_counter == 1'b1) begin		//If the reaction counter is enabled, start counting.
			count <= count + 1;
			if (KEY0 == 1'b1)
				count <= 0;				 end
											end

	always @ (*)
	if((KEY0 == 1'b1) & 
		(en_reaction_counter == 1'b1))		//Key0 should only be in effect when reaction counter is enabled
		reaction_time <= count;

endmodule
		