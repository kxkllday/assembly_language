DATAS SEGMENT
    ;此处输入数据段代码
    string db 0dh,0ah,'y=2X+3=','$'  
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
    mov ah,1
    int 21H
    and al,0FH
    mov cl,2
    mul cl
    add al,3
    lea dx,string
    mov ah,9
    int 21H
    add al,30H
    mov dl,al
    mov ah,2
    int 21h
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START