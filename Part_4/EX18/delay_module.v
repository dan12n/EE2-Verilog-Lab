//Delay

module processor (sysclk, data_in, data_out, wrreq, tick_10k, pulse);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			wrreq;
	output [9:0] 	data_out;	// 10-bit output data
	input 			tick_10k;
	input pulse;
	
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x;
	wire[9:0]      y;
	wire [9:0] q;
	wire full;
	wire wrreq;
	wire d_full;
	
	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x[9:0] = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	FIFO(sysclk, y[9:0], (d_full&pulse), pulse, full, q[9:0]);
	
	d_register(full, 1'b1, d_full);

	assign y[9:0] = x[9:0] - {q[9], q[9:1]};
	
	
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y[9:0] + DAC_OFFSET;
		
endmodule
