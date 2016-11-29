//16 bit Counter
`timescale 1ns / 100ps //unit time is 1ns, resolution 100ps

module counter_16 (clock, enable, count, reset);

	//--Declare ports--
	parameter BIT_SZ = 16;
	input clock;
	input enable;
	input reset;
	output [BIT_SZ-1:0] count;

	reg [BIT_SZ-1:0] count;

	initial count = 0;

	
	always @ (posedge clock) begin
		if (reset == 1'b1)
			count <= 0;

		if (enable == 1'b1)
			count <= count + 1'b1;
	end
			
endmodule // counter_16