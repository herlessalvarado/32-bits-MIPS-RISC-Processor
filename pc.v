module pc(clk,reset,out);

input clk;
input reset;
//input [0:31] in;
output reg [0:31] out;

initial
begin
	out=32'b00000000000000000000000000000000;
end

/*always @(in)
begin
	out = in;
end*/

always @(negedge clk)
	if(!reset)
		out = out + 4;
	else
		out = 0;

endmodule


/*module pc_adder(clk,newpc,reset);

input clk;
input [0:31] newpc;
output reg [0:31] reset;

always @(posedge clk)
	reset = newpc+4;
endmodule*/