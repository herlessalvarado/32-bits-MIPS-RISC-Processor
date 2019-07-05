module j_type_prueba;

reg clk,reset;
reg [0:5] Opcode;
reg [0:25] shiftin;
reg [0:4] rad1, rad2, writeadd;
reg [0:5] func;
reg [0:15] sign_in;

wire [0:31] in;
wire [0:31] out;
wire [0:31] instruction;
wire RegDst,Jump,Branch,ALUSrc;
wire [0:1] MemToReg;
wire [0:1] MemWrite;
wire [0:1] RegWrite;
wire [0:2] MemRead;
wire [0:1] ALUOp;
wire [0:2] ALUOpImmmediate;
wire [0:27] shiftout;
wire [0:31] jaddress;
wire [0:31] eliminar2;
wire [0:3] ALUControl;
wire [0:31] writedata;
wire [0:31] readdata1, readdata2;
wire [0:31] resmux;
wire [0:4] writereg;
wire [0:31] sign_out;
wire [0:31] data;
wire [0:31] alures;
wire zero;
wire outand;
wire [0:31] shiftout2;
wire [0:31] fandout;
wire [0:31] outpcshift;

pc pc1(clk,reset,out);
InstructionMemory in1(clk,out,instruction);
control con1(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,ALUOpImmmediate,MemWrite,ALUSrc,RegWrite);
pc_shift_left shift1(shiftin,shiftout);
shift_plus_pc shift2(shiftout,out,jaddress);
immediate_shift_left shift3(sign_out,shiftout2);
pc_add_shift2 shift4(out,shiftout2,outpcshift);
andm and1(zero,Branch,outand);
pc4_mux_sl2add mux6(out,outpcshift,outand,fandout);
control_mux_pc mux4(jaddress,fandout,Jump,eliminar2);
rad1_mux_pc mux5(eliminar2,readdata1,func,in);

ins_mux_reg mux1(rad2,writeadd,RegDst,writereg);
sign_extend sign1(sign_in,sign_out);
alu_control aluc1(ALUOp,ALUOpImmmediate,func,ALUControl);
reg_file reg1(clk,rad1,rad2,writereg,writedata,RegWrite,readdata1,readdata2);
reg_mux_alu mux2(readdata2,sign_out,ALUSrc,resmux);
alu alu1(clk,readdata1,resmux,ALUControl,alures,zero);
data_memory data1(clk,alures,readdata2,MemRead,MemWrite,data);
data_mux_reg mux3(data,alures,sign_out,out,MemToReg,writedata);

initial begin
    clk = 1'b1;
    reset = 1'b1;
    writeadd = 31;
    #30 reset = !reset;
	#300 $finish;
end

always
begin
    Opcode <= instruction[0:5];
    shiftin <= instruction[6:31];
    rad1 <= instruction[6:10];
    rad2 <= instruction[11:15];
	func <= instruction[26:31];
	sign_in <= instruction[16:31];
    #10 clk = !clk;
end

always begin
	#20
	case(Opcode)
        6'b000000: $display("JR readata 1 = %b ---- new pc = %b , time=%d",readdata1,in,$time); //jr
        6'b000010: $display("J address = %b ---- new pc = %b , time=%d",jaddress,in,$time); //j
        6'b000011: $display("JAL old pc = %b ---- new pc = %b , time=%d",writedata,in,$time); //jal
        6'b000100: $display("BEQ pc+imm = %b ---- new pc = %b , time=%d",outpcshift,in,$time); //beq
        6'b000101: $display("BNE pc+imm = %b ---- new pc = %b , time=%d",outpcshift,in,$time); //bne
        6'b000001: $display("BGEZ pc+imm = %b ---- new pc = %b , time=%d",outpcshift,in,$time); //bgez
	endcase
end

endmodule