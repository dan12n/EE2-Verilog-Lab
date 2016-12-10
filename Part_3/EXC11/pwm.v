module pwm (clk, data_in, load, pwm_out);
	
	input clk, load;
	input [9:0] data_in;
	output pwm_out;
	
	reg[9:0] d;
	reg[9:0] count;
	reg pwm_out;
	
	
	//PWM is zero by default, with load not asserted
	always@(posedge clk)
		if (load == 1'b1) d <= data_in;
		
	initial count = 10'd0;
	

	//Increments count till it reached data_in, and then sets PWM to zero, for one clock cycle
	always@(posedge clk)
		begin
			count <=  count + 1'b1;
			if (count > d) pwm_out <= 1'b0;
			else pwm_out <= 1'b1;
		end
endmodule