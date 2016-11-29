module pulse_gen (pulse, in, clk)
	input in, clk;
	output out;
	parameter N_STATE = 3; //This is the max number, but only three are used
	reg [1:0] state;
	reg pulse;
	
	parameter IDLE = 2'b00;
	parameter IN_HIGH = 2'b01;
	parameter WAIT_LOW = 2'b10;
	
	initial state = IDLE;
	initial pulse = 1'b0;
	
	always @(posedge clk)
		case (state)
			IDLE: if (in == 1'b1) state <= IN_HIGH;
			IN_HIGH: if (in == 1'b1) state <= IDLE;
						else state <= WAIT_LOW;
			default : ;
		endcase
		
	always @ (*)
		case (state)
			IDLE: out = 1'b0;
			IN_HIGH: out = 1'b1;
			WAIT_LOW: out = 1'b0;
		endcase