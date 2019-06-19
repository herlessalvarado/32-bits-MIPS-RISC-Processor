module alu(clk,in1, in2, op, res);

input clk;
input [0:31] in1;
input [0:31] in2;
input [0:5] op;
output reg [0:31] res;

always @(posedge clk)
begin
case (op)
	//mips instruction
	 6'b100000: res = in1 + in2; //add
	 6'b100010: res = in1 - in2; //sub
	 6'b100100: res = in1 & in2; //and
	 6'b100111: res = ~(in1 | in2); //nor
	 6'b100101: res = in1 | in2; //or
	 6'b101010: res = in1 < in2; //slt
endcase
end
endmodule