module sign_extend(sign_in,sign_out);

input [0:15] sign_in;
output [0:31] sign_out;

assign sign_out[16:31] = sign_in[0:15];
assign sign_out[0:15] = 1'b0;

endmodule