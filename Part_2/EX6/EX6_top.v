module EX6_top (CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4);
	
	input CLOCK_50;
	input[3:0] KEY;
	output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4;	
	
	wire CLOCK_div;
	wire[15:0] count;
	wire[3:0] BCD_0;
	wire[3:0] BCD_1;
	wire[3:0] BCD_2;
	wire[3:0] BCD_3;
	wire[3:0] BCD_4;
	
	divider_50000(CLOCK_50, CLOCK_div); 
	
	counter_16(CLOCK_50, (~KEY[0] & CLOCK_div), count[15:0], ~KEY[1]);
	
	bin2bcd_16(count[15:0], BCD_0[3:0], BCD_1[3:0], BCD_2[3:0], BCD_3[3:0], BCD_4[3:0]);
	
	hex_to_7seg(HEX0[6:0], BCD_0[3:0]);
	hex_to_7seg(HEX1[6:0], BCD_1[3:0]);
	hex_to_7seg(HEX2[6:0], BCD_2[3:0]);
	hex_to_7seg(HEX3[6:0], BCD_3[3:0]);
	hex_to_7seg(HEX4[6:0], BCD_4[3:0]);
	
endmodule