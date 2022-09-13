DATAS SEGMENT
    num1 dd 2A8B7654H
    num2 dw 5ABCH
    num3 dw 0h
    num4 dw 0h
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov ax,word ptr num1
    mov dx,word ptr num1+2
    div num2
    mov num3,ax
    mov num4,dx
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START