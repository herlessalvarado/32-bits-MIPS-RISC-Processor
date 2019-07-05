module control_mux_pc(in1,in2,jump,out);

input [0:31] in1;
input [0:31] in2;
input jump;
output [0:31] out;

assign out = jump == 1? in1:
	jump == 0? in2 : 0;

endmodule