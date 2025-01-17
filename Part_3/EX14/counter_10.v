//8 bit Counter
`timescale 1ns / 100ps //unit time is 1ns, resolution 100ps

module counter_10 (clock, enable, count);

	//--Declare ports--
	parameter BIT_SZ = 10;
	input clock;
	input enable;
	output [BIT_SZ-1:0] count;

	reg [BIT_SZ-1:0] count;

	initial count = 0;

	always @ (posedge clock)
		if(enable == 1'b1)
			count <= count + 1'b1;
		
endmodule // counter_8