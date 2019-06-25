module control(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,MemWrite,ALUSrc,RegWrite);

//check this variables bits
input [0:5] Opcode;
output reg RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite;
output reg [0:1] ALUOp;

always @(*)
begin
case (Opcode)
    6'b000000: begin
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b10;
    MemWrite = 1'b0;
    ALUSrc = 1'b0;
    RegWrite = 1'b1;
    end
endcase
end

endmodule