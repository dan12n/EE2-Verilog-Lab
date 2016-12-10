module EX6_top (CLOCK_50, KEY, HEX0, HEX1, HEX2, HEX3, HEX4);
	
	input CLOCK_50; 	//50 MHz clock
	input[3:0] KEY;
	output[6:0] HEX0, HEX1, HEX2, HEX3, HEX4; //7 Segment Values
	
	wire CLOCK_div;		//Clock divided by 50000
	wire[15:0] count;	//Count value
	wire[3:0] BCD_0;
	wire[3:0] BCD_1;
	wire[3:0] BCD_2;
	wire[3:0] BCD_3;
	wire[3:0] BCD_4;
	
	//Produces a tick for one clock cycle
	divider_50000	divideby5000	(CLOCK_50, CLOCK_div);
	
	//16 bit counter
	counter_16		count 			(CLOCK_50, (~KEY[0] & CLOCK_div), count[15:0], ~KEY[1]);
	//Enabled when Key0 is pressed, aligned with divided clock
	//Reset using Key 1
	
	//Converts the count value to BCD to be displayed
	bin2bcd_16		bin2bcd 		(count[15:0], BCD_0[3:0], BCD_1[3:0], BCD_2[3:0], BCD_3[3:0], BCD_4[3:0]);
	
	hex_to_7seg		seg0 			(HEX0[6:0], BCD_0[3:0]);
	hex_to_7seg 	seg1 			(HEX1[6:0], BCD_1[3:0]);
	hex_to_7seg 	seg2			(HEX2[6:0], BCD_2[3:0]);
	hex_to_7seg 	seg3			(HEX3[6:0], BCD_3[3:0]);
	hex_to_7seg 	seg4 			(HEX4[6:0], BCD_4[3:0]);
	
endmodule