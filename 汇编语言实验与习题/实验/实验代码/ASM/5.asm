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
    mov bx,000fh
    mov cx,000dh
    mov al,bl
    mov ah,0
    div cl
    mov ah,0;
    shl ax,1
    mov dx,ax
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START