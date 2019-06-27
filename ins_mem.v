module InstructionMemory(clk,address, instruction);

input clk;
input [0:31] address;
output reg [0:31] instruction;
reg [0:7] insmem [2047:0];

initial
begin
	//$readmemb("r_instructions_insmem.txt",insmem);
	$readmemb("i_instructions_insmem.txt",insmem);
	/*//add
	insmem[0] = 8'b00000001;
	insmem[1] = 8'b01001011;
	insmem[2] = 8'b01001000;
	insmem[3] = 8'b00100000;
	//sub
	insmem[4] = 8'b00000001;
	insmem[5] = 8'b01001011;
	insmem[6] = 8'b01001000;
	insmem[7] = 8'b00100010;
	//and
	insmem[8] = 8'b00000001;
	insmem[9] = 8'b01001011;
	insmem[10] = 8'b01001000;
	insmem[11] = 8'b00100100;
	//nor
	insmem[12] = 8'b00000001;
	insmem[13] = 8'b01001011;
	insmem[14] = 8'b01001000;
	insmem[15] = 8'b00100111;
	//or
	insmem[16] = 8'b00000001;
	insmem[17] = 8'b01001011;
	insmem[18] = 8'b01001000;
	insmem[19] = 8'b00100101;
	//slt
	insmem[20] = 8'b00000001;
	insmem[21] = 8'b01001011;
	insmem[22] = 8'b01001000;
	insmem[23] = 8'b00101010;
	//addi*/
end

always @(posedge clk)
begin 
	instruction[24:31] = insmem[address+3];
	instruction[16:23] = insmem[address+2];
	instruction[8:15] = insmem[address+1];
	instruction[0:7] = insmem[address];
end

endmodule