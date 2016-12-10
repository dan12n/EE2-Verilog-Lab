module FSM (clk, tick, trigger, time_out, en_lfsr, start_delay, ledr);
	parameter BIT_SZ = 13;

	input clk, tick, trigger, time_out;
	output en_lfsr, start_delay;
	output[9:0] ledr;

	reg en_lfsr, start_delay;
	initial start_delay = 1'b0;
	initial en_lfsr = 1'b0;
	reg[9:0] ledr;
	reg[3:0] state;

//Defining the states
	parameter IDLE 			= 4'b0000,
		  	  FIRST_LED 	= 4'b0001,
		  	  SECOND_LED 	= 4'b0011,
		  	  THIRD_LED 	= 4'b0010,
		  	  FOURTH_LED 	= 4'b0110,
		  	  FIFTH_LED 	= 4'b0111,
		  	  SIXTH_LED 	= 4'b0101,
		  	  SEVENTH_LED 	= 4'b0100,
		  	  EIGHTH_LED 	= 4'b1100,
		  	  NINTH_LED 	= 4'b1101,
		  	  TENTH_LED		= 4'b1111,
		  	  DELAY 		= 4'b1110,
		  	  TURNOFF 		= 4'b1010;
	
	initial state = IDLE;
	
	always @(posedge clk)
		case (state)
			IDLE 			: if (trigger==1'b1) 	state <= FIRST_LED;
			FIRST_LED 		: if (tick == 1'b1) 	state <= SECOND_LED;
			SECOND_LED 		: if (tick == 1'b1) 	state <= THIRD_LED;
			THIRD_LED 		: if (tick == 1'b1) 	state <= FOURTH_LED;
			FOURTH_LED 		: if (tick == 1'b1) 	state <= FIFTH_LED;
			FIFTH_LED 		: if (tick == 1'b1) 	state <= SIXTH_LED;
			SIXTH_LED 		: if (tick == 1'b1) 	state <= SEVENTH_LED;
			SEVENTH_LED 	: if (tick == 1'b1) 	state <= EIGHTH_LED;
			EIGHTH_LED 		: if (tick == 1'b1) 	state <= NINTH_LED;
			NINTH_LED 		: if (tick == 1'b1) 	state <= TENTH_LED;
			TENTH_LED		: if (tick == 1'b1) 	state <= DELAY;		
			DELAY 			: if (time_out==1'b1) 	state <= TURNOFF;	//Time_out when Delay time has finished
			TURNOFF 		: 						state <= IDLE;		//Goes back to IDLE state
		default: ;
	endcase // state

	//Outputs
	always @(*)
		case (state)
			IDLE 			: 		ledr[9:0] 	= 10'b0000000000;
			FIRST_LED 		: begin ledr[9:0] 	= 10'b0000000001;
									en_lfsr 	= 1'b1; 			end //The LFSR is enabled
			SECOND_LED 		: 		ledr[9:0] 	= 10'b0000000011;
			THIRD_LED 		: 		ledr[9:0] 	= 10'b0000000111;
			FOURTH_LED 		: 		ledr[9:0] 	= 10'b0000001111;
			FIFTH_LED 		: 		ledr[9:0] 	= 10'b0000011111;
			SIXTH_LED 		: 		ledr[9:0] 	= 10'b0000111111;
			SEVENTH_LED 	: 		ledr[9:0] 	= 10'b0001111111;
			EIGHTH_LED 		: 		ledr[9:0] 	= 10'b0011111111;
			NINTH_LED 		: begin ledr[9:0] 	= 10'b0111111111;
									en_lfsr 	= 1'b0; 			end //The LFSR is disabled atleast one cycle before
			TENTH_LED		: begin ledr[9:0] 	= 10'b1111111111;
									start_delay = 1'b1;					//Starts the delay state
									en_lfsr 	= 1'b0; 			end
			DELAY 			: begin ledr[9:0] 	= 10'b1111111111;
			TURNOFF 		: begin	ledr[9:0] 	= 10'b0000000000;
									start_delay = 1'b0; 			end
			default: ;
	endcase
	
endmodule


/*
module FSM (clk, tick, trigger, timeout, en_lfsr, start_delay, LEDR);
	parameter BIT_SZ = 5; //Number of bits in the delay counter

	input clk, tick, trigger, timeout;
	output reg en_lfsr, start_delay;
	output reg[9:0] LEDR;
	
	reg[BIT_SZ-1:0] count;
	reg[1:0] state;
	parameter IDLE = 2'b00, COUNTING = 2'B01, TIME_OUT = 2'b10;
	
	initial count = 10'd0;
	initial state = IDLE;
	initial en_lfsr = 1'b0;
	initial start_delay = 1'b0;
	initial LEDR = 10'd0;
	
	always @(posedge clk)
		case (state)
			IDLE: if (trigger==1'b1) state <= COUNTING;
			
			COUNTING: if (LEDR[9:0]==10'b111111111)
								state <= TIME_OUT;
						else if (tick == 1'b1) count <= count + 1;
						
			TIME_OUT: if (timeout == 1'b1) state <= IDLE;
			default: ;
		endcase
		
	always @ (*)
		case (state)
			IDLE: begin en_lfsr = 1'b1;
						LEDR[9:0] = 10'b0000000000;  end
						
			COUNTING: begin en_lfsr = 1'b1;
							LEDR[count] = 1'b1; end
			
			TIME_OUT: begin en_lfsr = 1'b0;
						start_delay=1'b1; end
			default: ;
		endcase
		
endmodule
*/