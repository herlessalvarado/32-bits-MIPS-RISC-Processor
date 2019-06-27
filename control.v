module control(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,ALUOpImmmediate,MemWrite,ALUSrc,RegWrite);

//check this variables bits
input [0:5] Opcode;
output reg RegDst,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite;
output reg [0:1] ALUOp;
output reg [0:2] ALUOpImmmediate;

always @(*)
begin
case (Opcode)
    6'b000000: begin //r-instructions
    RegDst = 1'b0;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b10;
    ALUOpImmmediate = 3'b000;
    MemWrite = 1'b0;
    ALUSrc = 1'b0;
    RegWrite = 1'b1;
    end
    6'b001000: begin // addi
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b001;
    MemWrite = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b1;
    end
    6'b001111: begin //subi
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b010;
    MemWrite = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b1;
    end
    6'b001100: begin //andi
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b011;
    MemWrite = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b1;
    end
    6'b001101: begin //ori
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b100;
    MemWrite = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b1;
    end
    6'b001010: begin //slti
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b101;
    MemWrite = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b1;
    end
endcase
end

endmodule