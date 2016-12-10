module ex10_top (SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK);
	input[9:0] SW;
	input CLOCK_50;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK;
	wire clk_div;
	
	divider_50000	divideby5000	(CLOCK_50, clk_div);
	
	spi2dac 		dac 			(CLOCK_50, SW[9:0], clk_div, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
endmodule