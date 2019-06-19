/*module prueba(clk,reset,out,res);

input clk,reset;
wire [0:31] instruction;
output wire [0:31] out,res;

reg [0:4] readadd1, readadd2, writeadd;
wire [0:15] writedata;
wire [0:31] readdata1, readdata2;
reg [0:15] in2;
input alusrc;
reg [0:5] op;
output [0:31] sol;

initial
begin
	writedata = instruction[16:20];
	readadd2 = instruction[11:15]
	readadd1 = instruction[6:10];
	op = instruction[26:31];	
end

pc pc1(clk,reset,out);
InstructionMemory ins1(clk,out,instruction);
reg_file reg1(clk,readadd1,readadd2,writeadd,writedata,readdata1,readdata2);
reg_mux_alu mux(readdata2,in2,alusrc,res);
alu alu1(clk,readdata1,res,op,sol);
endmodule*/

module prueba_tb;

reg clk,reset;
reg alusrc;
reg [0:15] inmux;
reg [0:5] op;
reg [0:4] rad1, rad2, writeadd;
wire [0:31] writedata;
wire [0:31] out;
wire [0:31] instruction;
wire [0:31] readdata1, readdata2;
wire [0:31] resmux;
wire [0:31] pcfour;


pc pc1(clk,reset,out);
InstructionMemory in1(clk,out,instruction);
reg_file reg1(clk,rad1,rad2,writeadd,writedata,readdata1,readdata2);
reg_mux_alu mux1(readdata2,inmux,alusrc,resmux);
alu alu1(clk,readdata1,resmux,op,writedata);


initial begin
	clk = 1'b1;
	reset = 1'b1;
	alusrc = 1'b0;
	inmux = 16'b0000000000000000;
	#20 reset = !reset;
	#200 $finish;
end

always
begin
	writeadd <= instruction[16:20];
	rad2 <= instruction[11:15];
	rad1 <= instruction[6:10];
	op <= instruction[26:31];
	#10 clk = !clk;
	
end

/*always
    #20
    $display("%b + %b = %b", readdata1, readdata2, writedata);
	#25
	$display("%b - %b = %b", readdata1, readdata2, writedata);
	#40
	$display("%b & %b = %b", readdata1, readdata2, writedata);
	#55
	$display("~(%b | %b) = %b", readdata1, readdata2, writedata);
	#70
	$display("%b | %b = %b", readdata1, readdata2, writedata);
	#85
	$display("%b < %b = %b", readdata1, readdata2, writedata);
end*/

always begin
	#18
	case(op)
		6'b100000: $display("%b + %b = %b", readdata1, readdata2, writedata); //add
	 	6'b100010: $display("%b - %b = %b", readdata1, readdata2, writedata); //sub
	 	6'b100100: $display("%b & %b = %b", readdata1, readdata2, writedata); //and
	 	6'b100111: $display("~(%b | %b) = %b", readdata1, readdata2, writedata); //nor
	 	6'b100101: $display("%b | %b = %b", readdata1, readdata2, writedata); //or
	 	6'b101010: $display("%b < %b = %b", readdata1, readdata2, writedata); //slt
	endcase
end

endmodule

//prueba u1(clk,reset,out,res);



/*initial
begin
	clk = 1'b0;
	reset = 1'b0;

	#100 $finish;
end

always
	#10 clk = !clk;
always
begin
	#5
	$display("A+B, result: %b\n", res;
end
endmodule*/