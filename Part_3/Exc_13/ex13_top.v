module ex13_top (CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT, HEX0, HEX1, HEX2);
	
	input 		CLOCK_50;
	output 		DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
	output [6:0]HEX0, HEX1, HEX2;
	wire 		clk_div;
	wire [9:0] 	A;
	wire [9:0] 	D;
	
	divider_50000 divideby50000	(CLOCK_50, clk_div);

	//10 bit counter with enable as the divided clock
	counter_10	counter 		(CLOCK_50, clk_div, A[9:0]);
	
	//Use counter as ROM address
	ROM			ROM_Counter 	(A[9:0], clk_div, D[9:0]);
	
	spi2dac 	DAC 			(CLOCK_50, D, clk_div, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

	pwm  		PWMOUT 			(CLOCK_50, D[9:0], clk_div, PWM_OUT);
	
	hex_to_7seg seg1			(D[3:0], HEX0[6:0]);
	hex_to_7seg seg2			(D[7:4], HEX1[6:0]);
	hex_to_7seg seg3			(D[9:8], HEX2[6:0]);
	


endmodule