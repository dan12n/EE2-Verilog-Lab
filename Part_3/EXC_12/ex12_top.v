module ex12_top (SW, CLOCK_50, HEX0, HEX1, HEX2);
	
	input [9:0] SW; //Input 10 switches
	input CLOCK_50; //Default 50 MHz Clock
	output[6:0] HEX0, HEX1, HEX2;
	wire [9:0] out;
	
	ROM			romaddress	(SW[9:0], CLOCK_50, out[9:0]); //ROM values controlled using switches
	
	//ROM output displayed on 7 Segment display
	hex_to_7seg	seg0		(out[3:0], HEX0[6:0]);
	hex_to_7seg seg1		(out[7:4], HEX1[6:0]);
	hex_to_7seg seg2		(out[9:8], HEX2[6:0]);
	
endmodule