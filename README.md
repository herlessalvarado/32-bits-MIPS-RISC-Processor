# 32-bits-MIPS-RISC-Processor

![alt text](https://github.com/herlessjap/32-bits-MIPS-RISC-Processor/blob/master/src/datapath.png "Datapath")

256 bytes Instruction Memory

256 bytes Data Memory

Big-endian datapath

| add | addi | lb  | beq  |
|-----|------|-----|------|
| sub | subi | lh  | bneq |
| and | andi | lw  | bgez |
| nor | ori  | sb  | j    |
| or  | slti | sh  | jr   |
| slt |      | sw  | jal  |
|     |      | lui |      |

Three different testbenches:
RI: First and Second column instructions
LS: Third column instructions
J: Fourth column instructions
