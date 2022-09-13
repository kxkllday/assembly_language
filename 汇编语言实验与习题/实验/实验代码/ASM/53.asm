DATAS SEGMENT
    ;此处输入数据段代码
    addr db 35h,2eh,28h
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov cx,3
    mov bx,offset addr
lop:
    mov bp,cx
    mov al,byte ptr[bx]
    mov dh,al
    mov dl,al
    mov cl,4
    shr dl,cl
    cmp dl,9h
    jbe next1
    add dl,7h
next1:
    add dl,30h
    mov ah,2
    int 21H
    mov dl,dh
    and dl,0fh
    cmp dl,9h
    jbe next2
    add dl,7h
next2:
    add dl,30h
    mov ah,2
    int 21H
    mov cx,bp
    inc bx
    mov dl,0ah
    mov ah,2
    int 21H
    loop lop
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START