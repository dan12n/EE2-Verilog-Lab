//Function 2-to-1 Mux

module mux2to1 (out, outbar, a, b, sel);
	output out, outbar;
	input a, b, sel;

	reg out;

	always @ (*)
	begin
		if (sel) out = a;
		else out = b;
	end
	assign outbar = ~out;

endmodule // mux2to1
          

module mux2to1 (out, outbar, a, b, sel);
	output [7:0] out, outbar;
	input [7:0] a, b
	input sel;

	reg [7:0] out;

	always @ (*)
	begin
		case (sel)
			1'b0: out = b;
			1'b1: out = a;
		endcase // sel
	end
	assign outbar = ~out;

endmodule // mux2to1


//Nested 4 to 1 mux
module mux2to1 (out, outbar, s0, s1, i0, i2, i1, i2, i3);
	output out, outbar;
	input s0, s1, i0, i2, i1, i2, i3;

	assign out = s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0);

	assign outbar = ~out;
endmodule // mux2to1


module hex_to_7seg (out, in);
	output [6:0] out;
	input [3:0] in;

	reg [6:0] out;

	alway @ (in)
	case (in)
		4'h0: out = 7'b1000000;
		4'h1: out = 7'b1111001;
		4'h2: out = 7'b0100100;
		4'h3: out = 7'b0110000;
		4'h4: out = 7'b0011001;
		4'h5: out = 7'b0010010;
		4'h6: out = 7'b0000010;
		4'h7: out = 7'b1111000;
		4'h8: out = 7'b0000000;
		4'h9: out = 7'b0011000;
		4'ha: out = 7'b0001000;
		4'hb: out = 7'b0000011;
		4'hc: out = 7'b1000110;
		4'hd: out = 7'b0100001;
		4'he: out = 7'b0000110;
		4'hf: out = 7'b0001110;
		default :
		      out = 7'b1111100;
	endcase

endmodule


module 10b_to_3_7seg (out, in)
	input [9:0] in;
	output [6:0] out1;
	output [6:0] out2;
	output [6:0] out3;

	reg [2:0] out;

	always @ (*)
		hex_to_7seg first_7_seg(out1, in[3:0]);
		hex_to_7seg second_7_seg(out2, in[7:4]);
		hex_to_7seg third_7_seg(out3, in[9:8]);	
	end
endmodule


module 10b_to_bcd (B, BCD_0, BCD_1, BCD_2);
	input [9:0]	B;		// binary input number
	output [3:0]	BCD_0, BCD_1, BCD_2, BCD_3;   // BCD digit LSD to MSD
	            	                                     // 
	wire [3:0] w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;
	wire [3:0] a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12;

	add3_ge5 A1 (w1,a1);
	add3_ge5 A2 (w2,a2);
	add3_ge5 A3 (w3,a3);
	add3_ge5 A4 (w4,a4);
	add3_ge5 A5 (w5,a5);
	add3_ge5 A6 (w6,a6);
	add3_ge5 A7 (w7,a7);
	add3_ge5 A8 (w8,a8);
	add3_ge5 A9 (w9,a9);
	add3_ge5 A10 (w10,a10);
	add3_ge5 A11 (w11,a11);
	add3_ge5 A12 (w12,a12);

	assign  w1 = {1'b0, B[9:7]};		// wn is the input port to module An
	assign  w2 = {a1[2:0], B[6]};
	assign  w3 = {a2[2:0, B[5]};
	assign  w4 = {1'b0, a1[3], a2[3], a3[3]};
	assign  w5 = {a3[2:0], B[4]};
	assign  w6 = {a4[2:0], a5[3]};
	assign  w7 = {a5[2:0], B[3]};
	assign  w8 = {a6[2:0], a7[3]};
	assign  w9 = {a7[2:0], B[2]};
	assign  w10 = {1'b0, a4[3], a6[3], a8[3]};
	assign  w11 = {a8[2:0], a9[3]};
	assign  w12 = {a9[2:0], B[1]};


	assign BCD_0 = {a12[2:0], B[0]};
	assign BCD_1 = {a11[2:0], a12[3]};
	assign BCD_2 = {a10[2:0], a11[3]};
	assign BCD_3 = {3'b0, a10[3]};

endmodule


module add3_ge5 (in, out); //W1 is input, and A1 is output
	input [3:0] in;
	output [3:0] out;

	if (input >= 5)
		output = input+3;
	else
		output = input;

endmodule




