module ex13_top (CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, pwm_out, HEX0, HEX1, HEX2);
	
	input CLOCK_50;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, pwm_out;
	output[6:0] HEX0, HEX1, HEX2;
	wire clk_div;
	wire[9:0] A;
	wire[9:0] D;
	
	divider_50000(CLOCK_50, clk_div);
	
	counter_10(CLOCK_50, clk_div, A[9:0]);
	
	ROM(A[9:0], clk_div, D[9:0]);
	
	spi2dac(CLOCK_50, D, clk_div, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm(CLOCK_50, D[9:0], clk_div, pwm_out);
	
	hex_to_7seg(D[3:0], HEX0[6:0]);
	hex_to_7seg(D[7:4], HEX1[6:0]);
	hex_to_7seg(D[9:8], HEX2[6:0]);
	


endmodule