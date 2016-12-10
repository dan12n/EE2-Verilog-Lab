module EX9_top (CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, LEDR);
	input CLOCK_50;
	input[3:0] KEY;
	output[9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	
	wire [15:0] reaction_time; //The reaction time to be displayed
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	
	wire clk_div_50000, clk_div_2500, trigger, en_reaction_counter;
	
	divider_50000	divideby5000	(CLOCK_50, clk_div_50000);
	divider_2500 	divideby2500	(clk_div_50000, CLOCK_50, clk_div_2500);
	
	//Enable the reaction counter when all LEDS are on and waits for KEY0 to be pressed to return to original state
	FSM 			FSM				(clk_div_50000, clk_div_2500, ~KEY[3], LEDR[9:0], en_reaction_counter, ~KEY[0]);
	
	//Counts the time between all LEDS on and KEY0 pressed
	reaction_counter countreaction	(en_reaction_counter, clk_div_2500, ~KEY[0], reaction_time[15:0]);

	//Display the reaction time on 7 Segment display
	bin2bcd_16 		bin2bcd 		(reaction_time[15:0], BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg 	seg0 			(BCD0[3:0], HEX0[6:0]);
	hex_to_7seg 	seg1 			(BCD1[3:0], HEX1[6:0]);
	hex_to_7seg 	seg2 			(BCD2[3:0], HEX2[6:0]);
	hex_to_7seg 	seg3 			(BCD3[3:0], HEX3[6:0]);
	hex_to_7seg 	seg4 			(BCD4[3:0], HEX4[6:0]);
	
endmodule