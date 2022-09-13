DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,123bh
    MOV DS,AX           ;ds 数据段寄存器，让数据段指向正确的位置
    mov ax,2h
    mov bx,0h
    mov ax,2h
    add ax,ax
    add ax,ax
    add ax,ax
    mov [bx],ax
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START