module ex2_top ( SW, HEX0);
	input [3:0] SW; //First Three Switches
	output [6:0] HEX0; //First Seven Segment Display
	hex_to_7seg SEG0(HEX0, SW); //Converts Hex to Seven Segment
endmodule