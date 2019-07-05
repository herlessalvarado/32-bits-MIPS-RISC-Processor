module pc_add_shift2(in1,in2,out);

input [0:31] in1,in2;
output [0:31] out;

assign out = in1+in2;

endmodule