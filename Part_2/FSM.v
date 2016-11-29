module fsm (clk, tick, trigger, time_out, en_lfsr, start_delay, ledr);
	input clk, tick, trigger, time_out;
	output en_lfsr, start_delay;
	output [9:0] ledr;
	
	integer i;
	reg[3:0] countvalue = 9;
	reg en_lfsr, start_delay;
	reg[9:0] ledr;

	parameter S_A = 4'b0001, S_B = 4'b0010; //Definition of the states
	parameter S_C = 4'b0100, S_D = 4'b1000;
	parameter NSTATE = 4; // Number of states
	reg [NSTATE-1:0] state; //Required as a register of NState
	
	//Lighting all the LEDS
	always @ (posedge tick)
		if (trigger == 1'b1) 
		 begin
			ledr[countvalue] <= 1'b1;
			countvalue <= countvalue - 1;
	    end
		//Checks if delay has been completed
		else if ((en_lfsr == 1'b1) & (time_out == 1'b1)) begin
			for (i=0; i<10; i=i+1) ledr[i] <= 1'b0;
		end
		
		//checks if all LEDS are on
	always @ (posedge clk)
		if (ledr == 10'b1111111111) begin
				en_lfsr <= 1'b1;
			//call lfsr module
				start_delay <= 1'b1;
			//call delay module
		end
			
			
			
			/*
		else  begin
			case (state)
				S_A: if (tick == 1'b1) state <= S_B;
				S_B: if (tick == 1'b1) state <= S_C;
				S_C: if (tick == 1'b0) state <= S_D;
				S_D: if (tick == 1'b1) state <= S_C;
						else state <= S_A;
				default: ; //This does nothing
	
			endcase
		end
		*/

/*		
	always @(*)
		case (state)
			S_A: out = 1'b0;
			S_B: out = 1'b0;
			S_C: out = 1'b1;
			S_D: out = 1'b1;
		endcase
*/	

endmodule // fsm