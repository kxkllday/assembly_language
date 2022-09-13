DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV  BX, 0001  
MOV  AL, 24
JZ  001E
LEA  BX, [0106]
MOV  AL, [BX]
ADD  [BX + 01], AL
JO  001E
SUB  [BX + 02], AL
MUL  CL
JNB  0021
MOV  [BX + 02], AL  
MOV  [BX + 02], AX
AAA
jl
inc
jns
neg
sub
shr
INT  3
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
