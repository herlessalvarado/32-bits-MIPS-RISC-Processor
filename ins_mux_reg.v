module ins_mux_reg(in1,in2,RegDst,out);

input [0:4] in1;
input [0:4] in2;
input RegDst;
output [0:4] out;

assign out = RegDst == 1? in1:
	RegDst == 0? in2 : 0;

endmodule