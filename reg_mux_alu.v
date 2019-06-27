module reg_mux_alu(in1,in2,alusrc,out);

input alusrc;
input [0:31] in1;
input [0:31] in2;
output [0:31] out;

assign out = alusrc == 0? in1:
	alusrc == 1? in2 : 0;

endmodule
