module pc_shift_left(in,out);

input [0:25] in;
output [0:27] out;

assign out = {in[0:25], 1'b0, 1'b0};

endmodule