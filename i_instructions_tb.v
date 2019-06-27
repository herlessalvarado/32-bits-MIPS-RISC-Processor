module i_type_prueba;

reg clk,reset;
reg [0:4] rad1, rad2, writeadd;
reg [0:5] Opcode;
reg [0:5] func;
reg [0:15] sign_in;

wire [0:31] out;
wire [0:31] instruction;
wire RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite;
wire [0:1] ALUOp;
wire [0:2] ALUOpImmmediate;
wire [0:3] ALUControl;
wire [0:31] writedata;
wire [0:31] readdata1, readdata2;
wire [0:31] resmux;
wire [0:4] writereg;
wire [0:31] sign_out;

pc pc1(clk,reset,out);
InstructionMemory in1(clk,out,instruction);
control con1(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,ALUOpImmmediate,MemWrite,ALUSrc,RegWrite);
ins_mux_reg mux1(rad2,writeadd,RegDst,writereg);
sign_extend sign1(sign_in,sign_out);
alu_control aluc1(ALUOp,ALUOpImmmediate,func,ALUControl);
reg_file reg1(clk,rad1,rad2,writereg,writedata,readdata1,readdata2);
reg_mux_alu mux2(readdata2,sign_out,ALUSrc,resmux);
alu alu1(clk,readdata1,resmux,ALUControl,writedata);

initial begin
    clk = 1'b1;
    reset = 1'b1;
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
    sign_in <= instruction[16:31];
	#10 clk = !clk;
end

always begin
    #21
	case(Opcode)
		6'b001000: $display("%b + %b = %b, time=%d", readdata1, sign_out, writedata,$time); //addi
        6'b001111: $display("%b - %b = %b, time=%d", readdata1, sign_out, writedata,$time); //subi
        6'b001100: $display("%b & %b = %b, time=%d", readdata1, sign_out, writedata,$time); //andi
        6'b001101: $display("%b | %b = %b, time=%d", readdata1, sign_out, writedata,$time); //ori
	 	6'b001010: $display("%b < %b = %b, time=%d", readdata1, sign_out, writedata,$time); //slti
	endcase
end

endmodule