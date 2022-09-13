DATAS SEGMENT
    ;此处输入数据段代码
    ans db ?  
DATAS ENDS
STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    MOV AX,1
    MOV CX,8
    MOV BX,2
one:
    MUL BL
    LOOP one
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START