//make counter a module:
module up_counter16(clk, outclk, max_value)
	input clk;
	output outclk;
	input[15:0] max_value;

	always @(posedge clk)
	begin
		if (count == max_value -1)
			count <= 16'b0;
		else
			count <= count + 1;
	end
endmodule // up_counter16

//EX8_delay
module EX8_delay (N, clk, trigger, time_out)
	input [6:0] N;
	input clk;
	input trigger;
	reg [6:0] count;

	initial time_out = 1'b0;

	always @ (posedge clk)
		if (trigger == 1'b1)
			begin
				if (count == N -1)
					count <= 7'b0;
					time_out = 1'b1;
				else
					count <= N + 1;
			end

endmodule

//LFSR
module lfsr7 (data_out, clk, enable);
	output [7:1] data_out;
	input clk;
	input enable;
	reg [7:1] sreg;

	initial sreg = 4'b1;

	always @(posedge clk)
		if (enable == 1'b1)
			sreg <= {sreg[6:1], sreg[1] ^ sreg[7]};
			assign data_out = sreg;
		else
			assign data_out = 7'b0;

endmodule // lfsr7



module fsm (clk, tick, trigger, time_out, en_lfsr, start_delay, ledr)
	input clk, tick, trigger, time_out;
	output en_lfsr, start_delay;
	output [9:0] ledr;
	parameter countvalue = 4'b0;

	parameter S_A = 4'b0001; S_B = 4'b0010; //Definition of the states
	parameter S_C = 4'b0100; S_D = 4'b1000;
	parameter NSTATE = 4; // Number of states
	reg [NSTATE-1:0] state; //Required as a register of NState
	
//Lighting all the LEDS
	always @ (posedge tick)
		if (trigger == 1'b1)
			ledr[countvalue] <= 1;
			countvalue = countvalue + 1;

	always @ (posedge clk)
		if (ledr == 10'b1111111111)
			en_lfsr <= 1'b1;
			//call lfsr module
			start_delay <= 1'b1;
			//call delay module
			
	always @ (posedge clk)
		if ((en_lfsr == 1'b1) && (time_out == 1'b1))
			ledr = 10'b1111111111;

		else 
			case (state)
				S_A: if (in == 1'b1) state <= S_B;
				S_B: if (in == 1'b1) state <= S_C;
				S_C: if (in == 1'b0) state <= S_D;
				S_D: if (in == 1'b1) state <= S_C;
						else state <= S_A;
				default: ; //This does nothing
	
			endcase
	
	always @(*)
		case (state)
			S_A: out = 1'b0;
			S_B: out = 1'b0;
			S_C: out = 1'b1;
			S_D: out = 1'b1;
		endcase
	

endmodule // fsm
