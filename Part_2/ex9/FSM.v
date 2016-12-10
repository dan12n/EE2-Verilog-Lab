module FSM (clk, tick, trigger, time_out, ledr, en_reaction_counter, KEY0);
	parameter BIT_SZ = 13;

	input clk, tick, trigger, time_out;
	output en_reaction_counter;
	output[9:0] ledr;
	input reg KEY0;
	
	reg en_reaction_counter;
	reg[9:0] ledr;
	reg[3:0] state;
	
	initial en_reaction_counter = 1'b0;

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
			IDLE 			: if (trigger==1'b1) 	state<= FIRST_LED;		//Triggered using KEY3
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
			DELAY 			: if (KEY0==1'b1) 		state <= TURNOFF;		//If KEY0 is pressed during this state, move to the last state
			TURNOFF 		: 						state <= IDLE;
		default: ;
	endcase // state

	

	always @(*)
		case (state)
			IDLE 			: begin ledr[9:0] = 10'b0000000000;
									en_reaction_counter = 1'b0; end 		//Disables the reaction counter by default
			FIRST_LED 		: 		ledr[9:0] = 10'b0000000001;
			SECOND_LED 		: 		ledr[9:0] = 10'b0000000011;
			THIRD_LED 		: 		ledr[9:0] = 10'b0000000111;
			FOURTH_LED 		: 		ledr[9:0] = 10'b0000001111;
			FIFTH_LED 		: 		ledr[9:0] = 10'b0000011111;
			SIXTH_LED 		: 		ledr[9:0] = 10'b0000111111;
			SEVENTH_LED 	: 		ledr[9:0] = 10'b0001111111;
			EIGHTH_LED 		: 		ledr[9:0] = 10'b0011111111;
			NINTH_LED 		: 		ledr[9:0] = 10'b0111111111;
			TENTH_LED		:     	ledr[9:0] = 10'b1111111111;
			DELAY 			: begin ledr[9:0] = 10'b1111111111;
									en_reaction_counter = 1'b1; end 		//Enables the reaction counter, to time the delay between all LEDS
			TURNOFF 		: begin	ledr[9:0] = 10'b0000000000;				//turning on and pressing KEY0 on FPGA
									en_reaction_counter = 1'b0; end 		//Disables the reaction counter
		default: ;
	endcase
	
endmodule