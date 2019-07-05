module immediate_shift_left(in,out);

input [0:31] in;
output [0:31] out;

assign out = {in[2:31], 1'b0, 1'b0};

endmodule