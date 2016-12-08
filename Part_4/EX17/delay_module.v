//Delay

module processor (sysclk, data_in, data_out, wrreq, tick_10k);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			wrreq;
	output [9:0] 	data_out;	// 10-bit output data
	input 			tick_10k;
	
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x;
	wire[9:0]      y;
	wire [9:0] q;
	wire full;
	
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x[9:0] = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
//	d_register(full, tick_10k, d_full);
	
	FIFO(tick_10k, x[9:0], full, 1'b1, full, q[9:0]);
	

	assign y[9:0] = {q[9], q[9:1]};
	
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y[9:0] + x[9:0] + DAC_OFFSET;
		
endmodule
