module InstructionMemory(clk,address, instruction);

input clk;
input [0:31] address;
output reg [0:31] instruction;
reg [0:7] insmem [2047:0];

initial
begin
	//$readmemb("r_instructions_insmem.txt",insmem);
	//$readmemb("i_instructions_insmem.txt",insmem);
	//$readmemb("ri_instructions_insmem.txt",insmem);
	//$readmemb("ls_instructions_insmem.txt",insmem);
	$readmemb("j_instructions_insmem.txt",insmem);
end

always @(posedge clk)
begin 
	instruction[24:31] = insmem[address+3];
	instruction[16:23] = insmem[address+2];
	instruction[8:15] = insmem[address+1];
	instruction[0:7] = insmem[address];
end

endmodule