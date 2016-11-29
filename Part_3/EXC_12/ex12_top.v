module ex12_top (SW, CLOCK_50, HEX0, HEX1, HEX2);
	
	input [9:0] SW;
	input CLOCK_50;
	output[6:0] HEX0, HEX1, HEX2;
	wire [9:0] out;
	
	ROM(SW[9:0], CLOCK_50, out[9:0]);
	
	hex_to_7seg(out[3:0], HEX0[6:0]);
	hex_to_7seg(out[7:4], HEX1[6:0]);
	hex_to_7seg(out[9:8], HEX2[6:0]);
	
endmodule