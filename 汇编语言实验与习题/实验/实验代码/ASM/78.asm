DATAS SEGMENT
    string db 10,?,10 dup(?),'$'
DATAS ENDS
STACKS SEGMENT
STACKS ENDS
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    lea dx,string
    mov ah,0AH
    int 21H
    mov bx,offset string
    mov cl,[bx+1]
    mov ch,0
    add bx,2
    call change
    lea dx,string+2
    mov ah,9
    int 21H
    MOV AH,4CH
    INT 21H
change:
    and byte ptr [bx],11011111b
    inc bx
    loop change
    ret
CODES ENDS
    END START