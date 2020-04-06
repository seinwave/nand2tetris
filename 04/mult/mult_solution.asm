@0
    D=A
    @R2
    M=D

(LOOP)
@R1
D=M
 @END
D;JEQ

@R1
D=A
M=M-D

@R0
D=M
@R2
M=M+D

@LOOP
0;JMP

(END)
@END
0;JMP