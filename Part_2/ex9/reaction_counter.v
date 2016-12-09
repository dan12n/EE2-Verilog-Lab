module reaction_counter (en_reaction_counter, clk_div_2500, KEY0, reaction_time);
	input en_reaction_counter, clk_div_2500, KEY0;
	output [15:0] reaction_time;

	reg [15:0] count;
	
	reg[15:0] reaction_time;

	initial count = 16'b0;
	initial reaction_time = 16'b0;

	always @(posedge clk_div_2500) begin
		if (en_reaction_counter == 1'b1)
			count <= count + 1;
		if (KEY0 == 1'b1)
			count <= 0;
			end
	always @ (*)
	if(KEY0 == 1'b1) begin
		reaction_time <= count; end
endmodule
		