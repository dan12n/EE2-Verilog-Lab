//async addder

module async_adder(A, SW, out);
	input [9:0] A;
	input [9:0] SW;
	output[9:0] out;
	
	assign out[9:0] = A[9:0] + SW[9:0];
	
endmodule