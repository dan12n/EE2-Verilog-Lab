module EX8_top (CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, LEDR);
	input CLOCK_50;
	input[3:0] KEY;
	output[9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	
	wire[12:0] prbs;
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	
	wire clk_div_50000, clk_div_2500, trigger, start_delay, time_out, en_lfsr;
	
	divider_50000 	divideby5000 	(CLOCK_50, clk_div_50000);
	divider_2500 	divideby2500 	(clk_div_50000, CLOCK_50, clk_div_2500);
	
	lfsr13			LFSR 			(prbs[12:0], clk_div_50000, en_lfsr);
	
	EX8_delay       delay 			(prbs[12:0], clk_div_50000, start_delay, time_out);
	
	FSM 			finitestatem	(clk_div_50000, clk_div_2500, ~KEY[3], time_out, en_lfsr, start_delay, LEDR[9:0]);
	
	bin2bcd_16		bin2bcd 		(prbs[12:0], BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg		seg0 			(BCD0[3:0], HEX0[6:0]);
	hex_to_7seg		seg1			(BCD1[3:0], HEX1[6:0]);
	hex_to_7seg		seg2			(BCD2[3:0], HEX2[6:0]);
	hex_to_7seg		seg3			(BCD3[3:0], HEX3[6:0]);
	hex_to_7seg 	seg4			(BCD4[3:0], HEX4[6:0]);
	
endmodule