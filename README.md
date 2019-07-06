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

Instructions done:

add t1, t2, t3

sub t1, t2, t3

and t1, t2, t3

nor t1, t2, t3

or t1, t2, t3

slt t1, t2, t3

addi t1, t2, 1

subi t1, t2, 1

andi t1, t2, 1

ori t1, t2, 1

slti t1, t2, 1

lw t1, 1(s1)

lh t2, 1(s2)

lb t5, 1(s5)

sw t7, 0(s1)

sh t7, 6(s1)

sb t7, 9(s1)

lui s0, ffff

jal 1

j 11

jr t0

beq t0, t1, 1

bne t0, t1, 1

bgez t1, 1
