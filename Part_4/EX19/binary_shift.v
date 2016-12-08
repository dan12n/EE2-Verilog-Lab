module binary_shift(data_in, data_out);
	input[9:0] data_in;
	output[9:0] data_out;
	
	assign data_out[9:0] = data_in[9:0]/2;
	
endmodule