module EX7_top (KEY, HEX0, HEX1, HEX2, HEX3, BCD0, BCD1, BCD2, BCD3);
	
	input[3:0] KEY;
	output[3:0] BCD0, BCD1, BCD2, BCD3;
	output[6:0] HEX0, HEX1, HEX2, HEX3;
	wire[7:0] randomvalue;
	
	//LFSR with polynomial: 1 + x + x^7
	lfsr7 		lfsr 	(randomvalue[6:0], KEY[3]);
	//Key[3] provided as CLK
	
	//Converts LFSR output to display on 7 Segment display
	b_to_bcd 	bin2bcd	(randomvalue[6:0], BCD0[3:0], BCD1[3:0], BCD2[3:0], BCD3[3:0]);
	
	dec_to_7seg	seg0 	(BCD0, HEX0);
	dec_to_7seg	seg1	(BCD1, HEX1);
	dec_to_7seg	seg2	(BCD2, HEX2);
	dec_to_7seg	seg3	(BCD3, HEX3);
	
endmodule