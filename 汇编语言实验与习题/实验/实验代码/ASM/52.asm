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
    mov bh,61h
    mov bl,62h    ;初始bx为ab
    mov dl,bh
    sub dl,20h
    mov ah,2
    int 21H
    mov dl,bl
    sub dl,20h
    mov ah,2
    int 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START