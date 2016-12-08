module ex15_top (CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT, HEX0, HEX1, HEX2, HEX3, HEX4, ADC_SDI, ADC_CS, ADC_SCK, ADC_SDO);
	input CLOCK_50;
	output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
	output ADC_SDI, ADC_CS, ADC_SCK, ADC_SDO;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

	
	wire data_valid;	
	wire sdata_to_adc;	
	wire adc_cs;			
	wire adc_sck;		
	wire clkdiv;
	wire [25:0] mult_result;
	wire [3:0]	BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
	wire [9:0] add_result, A, D;
	wire [9:0] data;
	
//Inputs
	spi2adc(CLOCK_50, clkdiv, 1'b0, data[9:0], data_valid, ADC_SDI, ADC_CS, ADC_SCK, ADC_SDO); 
	//data_from_adc -> data
	//data_out_of_rom -> D
	
//Top Branch of schematic:	
	multiplier(data[9:0], mult_result[23:0]);
	bin2bcd_16({2'd0, mult_result[23:10]},  BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	dec_to_7seg(BCD_0, HEX0);
	dec_to_7seg(BCD_1, HEX1);
	dec_to_7seg(BCD_2, HEX2);
	dec_to_7seg(BCD_3, HEX3);
	dec_to_7seg(BCD_4, HEX4);
	
	
//Bottom Branch
	divider_5000(CLOCK_50, clkdiv);
	async_adder(A[9:0], data[9:0], add_result[9:0]);
	d_register (add_result[9:0], clkdiv, A[9:0]);
	ROM(A[9:0], clkdiv, D[9:0]);
	
//Final outputs
	spi2dac(CLOCK_50, D[9:0], clkdiv, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm(CLOCK_50, D[9:0], clkdiv, PWM_OUT);
	
endmodule