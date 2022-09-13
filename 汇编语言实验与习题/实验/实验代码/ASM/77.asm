DATAS SEGMENT
    ;此处输入数据段代码
    a    dw   100, 30, 78, 99, 15, -1, 66, 54, 189, 256  
    i dw 0
    j dw 0
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
    MOV CX,9
ONE:
    CMP I,CX
    JNB SKIP1
    MOV SI,OFFSET A
TWO:
    CMP J,CX
    JNB SKIP2
    MOV BX,[SI]
    CMP BX,[SI+2]
    JB SKIPSWAP
    MOV AX,[SI]
    MOV BX,[SI+2]
    MOV [SI],BX
    MOV [SI+2],AX
SKIPSWAP:
    ADD SI,2
    INC J
    JMP TWO
SKIP2:
    INC I
    JMP ONE
SKIP1:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START