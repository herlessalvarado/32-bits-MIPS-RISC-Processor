module control(Opcode,RegDst,Jump,Branch,MemRead,MemToReg,ALUOp,ALUOpImmmediate,MemWrite,ALUSrc,RegWrite);

//check this variables bits
input [0:5] Opcode;
output reg RegDst,Jump,Branch,ALUSrc;
output reg [0:1] ALUOp,MemWrite,MemToReg,RegWrite;
output reg [0:2] MemRead;
output reg [0:2] ALUOpImmmediate;

always @(*)
begin
case (Opcode)
    6'b000000: begin //r-instructions and jr
    RegDst = 1'b0;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b000;
    MemToReg = 2'b00;
    ALUOp = 2'b10;
    ALUOpImmmediate = 3'b000;
    MemWrite = 2'b00;
    ALUSrc = 1'b0;
    RegWrite = 2'b01;
    end
    6'b001000: begin // addi
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b000;
    MemToReg = 2'b00;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b001;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b111111: begin //subi
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b000;
    MemToReg = 2'b00;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b010;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b001100: begin //andi
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b000;
    MemToReg = 2'b00;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b011;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b001101: begin //ori
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b000;
    MemToReg = 2'b00;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b100;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b001010: begin //slti
    RegDst = 1'b1;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b000;
    MemToReg = 2'b00;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b101;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b100011: begin //lw
    RegDst = 1'b0;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b110;
    MemToReg = 2'b01;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b001;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b100000: begin //lb
    RegDst = 1'b0;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b100;
    MemToReg = 2'b01;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b001;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b100001: begin //lh
    RegDst = 1'b0;
    Jump = 1'b0;
    Branch = 1'b0;
    MemRead = 3'b010;
    MemToReg = 2'b01;
    ALUOp = 2'b11;
    ALUOpImmmediate = 3'b001;
    MemWrite = 2'b00;
    ALUSrc = 1'b1;
    RegWrite = 2'b01;
    end
    6'b101011 : begin //sw
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b0;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b001;
     MemWrite= 2'b11;
     ALUSrc = 1'b1;
     RegWrite= 2'b00;
    end
    6'b101001: begin //sh
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b0;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b001;
     MemWrite= 2'b10;
     ALUSrc = 1'b1;
     RegWrite= 2'b00;
    end
    6'b101000: begin //sb
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b0;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b001;
     MemWrite= 2'b01;
     ALUSrc = 1'b1;
     RegWrite= 2'b00;
    end
    6'b001111: begin //lui
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b0;
     MemRead = 3'b111;
     MemToReg= 2'b10;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b001;
     MemWrite= 2'b00;
     ALUSrc = 1'b1;
     RegWrite= 2'b10;
     end
     6'b000010: begin //j
     RegDst = 1'b0;
     Jump = 1'b1;
     Branch = 1'b0;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b00;
     ALUOpImmmediate = 3'b000;
     MemWrite= 2'b00;
     ALUSrc = 1'b0;
     RegWrite= 2'b00;
     end
     6'b000011: begin //jal
     RegDst = 1'b0;
     Jump = 1'b1;
     Branch = 1'b0;
     MemRead = 3'b000;
     MemToReg= 2'b11;
     ALUOp = 2'b00;
     ALUOpImmmediate = 3'b000;
     MemWrite= 2'b00;
     ALUSrc = 1'b0;
     RegWrite= 2'b01;
     end
     6'b000100: begin //beq
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b1;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b010;
     MemWrite= 2'b00;
     ALUSrc = 1'b0;
     RegWrite= 2'b00;
     end
     6'b000101: begin //bne
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b1;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b010;
     MemWrite= 2'b00;
     ALUSrc = 1'b0;
     RegWrite= 2'b00;
     end
     6'b000001: begin //bgez
     RegDst = 1'b0;
     Jump = 1'b0;
     Branch = 1'b0;
     MemRead = 3'b000;
     MemToReg= 2'b00;
     ALUOp = 2'b11;
     ALUOpImmmediate = 3'b010;
     MemWrite= 2'b00;
     ALUSrc = 1'b0;
     RegWrite= 2'b00;
     end
endcase
end

endmodule