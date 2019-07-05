module ls_type_prueba;

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
    #40 reset = !reset;
	#300 $finish;
end

always
begin
    Opcode <= instruction[0:5];
    rad1 <= instruction[6:10];
    rad2 <= instruction[11:15];
	writeadd <= instruction[11:15];
	func <= instruction[26:31];
    sign_in <= instruction[16:31];
    #10 clk = !clk;
end

always begin
    #20
	case(Opcode)
		6'b100011: $display("LW s1 = %b + offset = %b, t1 = %b, time=%d", readdata1,sign_out,writedata,$time); //lw
        6'b100000: $display("LB s5 = %b + offset = %b, t5 = %b, time=%d", readdata1,sign_out,writedata,$time); //lb
        6'b100001: $display("LH s2 = %b + offset = %b, t2 = %b, time=%d", readdata1,sign_out,alures,$time); //lh
        6'b101011: $display("SW s1 = %b + offset = %b, t7 = %b, time=%d", readdata1,sign_out,alures,$time); //sw
        6'b101001: $display("SH s1 = %b + offset = %b, t7 = %b, time=%d", readdata1,resmux,alures,$time); //sh
        6'b101000: $display("SB s1 = %b + offset = %b, t7 = %b, time=%d", readdata1,sign_out,alures,$time); //sb
        6'b001111: $display("LUI offset = %b s0 = %b, time=%d",readdata2,writedata,$time); //lui
	endcase
end


endmodule