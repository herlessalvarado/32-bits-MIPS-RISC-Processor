module alu(clk,in1, in2, ALUControl, res,zero);

input clk;
input [0:31] in1;
input [0:31] in2;
input [0:3] ALUControl;
output reg [0:31] res;
output reg zero;

always @(*)
begin
case (ALUControl)
	//mips instruction
	 4'b0010: res = in1 + in2; //add
	 4'b0110: res = in1 - in2; //sub
	 4'b0000: res = in1 & in2; //and
	 4'b1100: res = ~(in1 | in2); //nor
	 4'b0001: res = in1 | in2; //or
	 4'b0111: res = in1 < in2; //slt
endcase
end

always @(posedge clk)begin
	if (res == 0)
		zero = 1'b0;
	else
		zero = 1'b1;
end

always @(negedge clk)begin
	if (res >= 0)
		zero = 1'b1;
end
endmodule