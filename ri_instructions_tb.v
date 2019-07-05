module ri_type_prueba;

reg clk,reset;
reg [0:4] rad1, rad2, writeadd;
reg [0:5] Opcode;
reg [0:5] func;
reg [0:15] sign_in;

wire [0:31] out;
wire [0:31] instruction;
wire RegDst,Jump,Branch,ALUSrc;
wire [0:1] MemToReg;
wire [0:1] MemWrite;
wire [0:1] RegWrite;
wire [0:2] MemRead;
wire [0:1] ALUOp;
wire [0:2] ALUOpImmmediate;
wire [0:3] ALUControl;
wire [0:31] writedata;
wire [0:31] readdata1, readdata2;
wire [0:31] resmux;
wire [0:4] writereg;
wire [0:31] sign_out;
wire [0:31] data;
wire [0:31] alures;
wire zero;
wire [0:31] pcaddress;

pc pc1(clk,reset,out);
InstructionMemory in1(clk,out,instruction);
control con1(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,ALUOpImmmediate,MemWrite,ALUSrc,RegWrite);
ins_mux_reg mux1(rad2,writeadd,RegDst,writereg);
sign_extend sign1(sign_in,sign_out);
alu_control aluc1(ALUOp,ALUOpImmmediate,func,ALUControl);
reg_file reg1(clk,rad1,rad2,writereg,writedata,RegWrite,readdata1,readdata2);
reg_mux_alu mux2(readdata2,sign_out,ALUSrc,resmux);
alu alu1(clk,readdata1,resmux,ALUControl,alures,zero);
data_memory data1(clk,alures,readdata2,MemRead,MemWrite,data);
data_mux_reg mux3(data,alures,sign_out,pcaddress,MemToReg,writedata);

initial begin
    clk = 1'b1;
    reset = 1'b1;
    #20 reset = !reset;
	#500 $finish;
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
	case(func)
		6'b100000: $display("R-type %b + %b = %b, time=%d", readdata1, readdata2, writedata,$time); //add
	 	6'b100010: $display("R-type %b - %b = %b, time=%d", readdata1, readdata2, writedata,$time); //sub
	 	6'b100100: $display("R-type %b & %b = %b, time=%d", readdata1, readdata2, writedata,$time); //and
	 	6'b100111: $display("R-type ~(%b | %b) = %b, time=%d", readdata1, readdata2, writedata,$time); //nor
	 	6'b100101: $display("R-type %b | %b = %b, time=%d", readdata1, readdata2, writedata,$time); //or
	 	6'b101010: $display("R-type %b < %b = %b, time=%d", readdata1, readdata2, writedata,$time); //slt
	endcase
end

always begin
    #20
    case(Opcode)
        6'b001000: $display("I-type %b + %b = %b, time=%d", readdata1, sign_out, alures,$time); //addi
        6'b111111: $display("I-type %b - %b = %b, time=%d", readdata1, sign_out, alures,$time); //subi
        6'b001100: $display("I-type %b & %b = %b, time=%d", readdata1, sign_out, alures,$time); //andi
        6'b001101: $display("I-type %b | %b = %b, time=%d", readdata1, sign_out, alures,$time); //ori
	 	6'b001010: $display("I-type %b < %b = %b, time=%d", readdata1, sign_out, alures,$time); //slti
    endcase
end

endmodule