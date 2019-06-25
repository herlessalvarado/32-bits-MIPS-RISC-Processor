module r_type_prueba;

reg clk,reset;
reg [0:4] rad1, rad2, writeadd;
reg [0:5] Opcode;
reg [0:5] func;
reg [0:15] inmux;

wire [0:31] out;
wire [0:31] instruction;
wire RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite;
wire [0:1] ALUOp;
wire [0:3] ALUControl;
wire [0:31] writedata;
wire [0:31] readdata1, readdata2;
wire [0:31] resmux;

pc pc1(clk,reset,out);
InstructionMemory in1(clk,out,instruction);
control con1(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,MemWrite,ALUSrc,RegWrite);
alu_control aluc1(ALUOp,func,ALUControl);
reg_file reg1(clk,rad1,rad2,writeadd,writedata,readdata1,readdata2);
reg_mux_alu mux1(readdata2,inmux,ALUSrc,resmux);
alu alu1(clk,readdata1,resmux,ALUControl,writedata);

initial begin
    clk = 1'b1;
    reset = 1'b1;
    inmux = 16'b0000000000000000;
    #20 reset = !reset;
	#150 $finish;
end

always
begin
    Opcode <= instruction[0:5];
    rad1 <= instruction[6:10];
    rad2 <= instruction[11:15];
	writeadd <= instruction[16:20];
	func <= instruction[26:31];
	#10 clk = !clk;
end

always begin
	#21
	case(func)
		6'b100000: $display("%b + %b = %b, time=%d", readdata1, readdata2, writedata,$time); //add
	 	6'b100010: $display("%b - %b = %b, time=%d", readdata1, readdata2, writedata,$time); //sub
	 	6'b100100: $display("%b & %b = %b, time=%d", readdata1, readdata2, writedata,$time); //and
	 	6'b100111: $display("~(%b | %b) = %b, time=%d", readdata1, readdata2, writedata,$time); //nor
	 	6'b100101: $display("%b | %b = %b, time=%d", readdata1, readdata2, writedata,$time); //or
	 	6'b101010: $display("%b < %b = %b, time=%d", readdata1, readdata2, writedata,$time); //slt*/
	endcase
end

endmodule