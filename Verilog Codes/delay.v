module delay (sysclk, trigger, n, time_out);
	parameter BIT_SZ = 10; //Number of bits in the delay counter

	input sysclk, trigger;
	input [BIT_SZ-1:0] n;
	output time_out;
	
	reg [BIT_SZ-1:0] count;
	reg time_out;
	
	reg[1:0] state;
	parameter IDLE = 2'b00, COUNTING = 2'B01;
	parameter TIME_OUT = 2'b10, WAIT_LOW = 2'b11;
	
	initial state = IDLE;
	initial count = n - 1'b1;
	
	always @(posedge clk)
		case (state)
			IDLE: if (trigger==1'b1) state <= counting;
			COUNTING: if (count==0) begin
						count <= n-1'b1;
						state <= TIME_OUT;
						end
					else count <= count - 1'b1;
			TIME_OUT: if (trigger == 1'b0) state <= IDLE;
					else state <= WAIT_LOW;
			WAIT_low: if (trigger==1'b0) state <= IDLE;
			default: ;
		endcase
		
	always @ (*)
		case (state)
			IDLE: time_out = 1'b0;
			COUNTING: time_out = 1'b0;
			TIME_OUT: time_out = 1'b1;
			WAIT_low: time_out = 1'b1;
			default: ;
		endcase
		
endmodule