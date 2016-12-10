module ex14_top (CLOCK_50, SW, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT, HEX0, HEX1, HEX2, HEX3);
	input CLOCK_50;
	input [9:0] SW;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	
	wire clkdiv;
	wire [25:0] mult_result;
	wire [3:0]	BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
	wire [9:0] add_result, A, D;


//Top Branch of schematic:	
	multiplier	mult_const	(SW[9:0], mult_result[23:0]); //Mutliplies by a constant value
	bin2bcd_16	bin2bcd 	(mult_result[25:10],  BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	dec_to_7seg dec_to_7seg_0 (BCD_0, HEX0);
	dec_to_7seg dec_to_7seg_1 (BCD_1, HEX1);
	dec_to_7seg dec_to_7seg_2 (BCD_2, HEX2);
	dec_to_7seg dec_to_7seg_3 (BCD_3, HEX3);
	
	
//Bottom Branch
	divider_5000 divideby5000 (CLOCK_50, clkdiv);
	async_adder  addresult 	  (A[9:0], SW[9:0], add_result[9:0]);
	d_register	 register     (add_result[9:0], clkdiv, A[9:0]);
	ROM          data_rom	  (A[9:0], clkdiv, D[9:0]);
	
//Final outputs
	spi2dac		dac 	(CLOCK_50, D[9:0], clkdiv, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm         pulsewidth (CLOCK_50, D[9:0], clkdiv, PWM_OUT);
	
endmodule