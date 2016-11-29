module ex13_top (CLOCK_50);
	
	input CLOCK_50;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK;
	wire clk_div;
	reg[9:0] A;
	wire[9:0] D;
	
	divider_50000(CLOCK_50, clk_div);
	counter_10(CLOCK_50, clk_div, A[9:0]);
	ROM(A[9:0], clk_div, D[9:0]);
	
	spi2dac(CLOCK_50, D, clk_div, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm(CLOCk
	

endmodule