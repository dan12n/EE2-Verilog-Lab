//Delay

module processor (sysclk, data_in, data_out, enable, tick_10k, data_valid, SW);

	input			sysclk;		// system clock
	input 	[9:0]	data_in;		// 10-bit input data
	output 	[9:0] 	data_out;	// 10-bit output data
	input 			tick_10k;
	input 			data_valid;
	input	[8:0] 	SW;
	input 			enable;
	
	
	wire 	[12:0] 	rdaddress, wraddress;
	wire			sysclk;
	wire 	[9:0]	data_in;
	reg 	[9:0] 	data_out;
	wire 	[9:0]	x;
	wire	[9:0]   y;
	wire 	[9:0] 	q;
	
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x[9:0] = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement

	//Signed shift
	assign y[9:0] = x[9:0] - {q[8], q[8:0]};
	
	ram_2_port(sysclk, y[9:1], rdaddress[12:0], enable, wraddress[12:0], enable, q[8:0]);
	
	counter_13 (rdaddress[12:0], 1'b1, ~data_valid, 1'b0);
	
	assign wraddress[12:0] = {SW[8:0],3'b0} + rdaddress[12:0];
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y[9:0] + DAC_OFFSET;
		
endmodule
