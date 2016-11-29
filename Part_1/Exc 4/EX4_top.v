module EX4_top (SW, HEX0, HEX1, HEX2);
	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;

	wire[3:0] BCD0;
	wire[3:0] BCD1;
	wire[3:0] BCD2;
	wire[3:0] BCD3;
	
	b_to_bcd converter(SW[9:0], BCD0[3:0], BCD1[3:0], BCD2[3:0], BCD3[3:0]);
	
	dec_to_7seg SEG0(HEX0, BCD0);
	dec_to_7seg SEG1(HEX1, BCD1);
	dec_to_7seg SEG2(HEX2, BCD2);	
endmodule