module pc4_mux_sl2add(in1,in2,opt,out);

input [0:31] in1;
input [0:31] in2;
input opt;
output [0:31] out;

assign out = opt == 0? in1:
	opt == 1? in2 : 0;

endmodule