module alu_control(ALUOp,ALUOpImmmediate,func,ALUControl);

input [0:1] ALUOp;
input [0:2] ALUOpImmmediate;
input [0:5] func;
output reg [0:3] ALUControl;

always @(ALUOp & func)
begin
    if (ALUOp == 2'b10 & func == 6'b100000) //add
        ALUControl = 4'b0010;
    if (ALUOp == 2'b10 & func == 6'b100010) //sub
        ALUControl = 4'b0110;
    if (ALUOp == 2'b10 & func == 6'b100100) //and
        ALUControl = 4'b0000;
    if (ALUOp == 2'b10 & func == 6'b100111) //nor
        ALUControl = 4'b1100;
    if (ALUOp == 2'b10 & func == 6'b100101) //or
        ALUControl = 4'b0001;
    if (ALUOp == 2'b10 & func == 6'b101010) //slt
        ALUControl = 4'b0111;
end

always @(ALUOp & ALUOpImmmediate)
begin
    if (ALUOp == 2'b11 & ALUOpImmmediate == 3'b001) //addi
        ALUControl = 4'b0010;
    if (ALUOp == 2'b11 & ALUOpImmmediate == 3'b010) //subi
        ALUControl = 4'b0110;
    if (ALUOp == 2'b11 & ALUOpImmmediate == 3'b011) //andi
        ALUControl = 4'b0000;
    if (ALUOp == 2'b11 & ALUOpImmmediate == 3'b100) //ori
        ALUControl = 4'b0001;   
    if (ALUOp == 2'b11 & ALUOpImmmediate == 3'b101) //slti
        ALUControl = 4'b0111;
end

endmodule