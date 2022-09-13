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
    mov ah,1h
    int 21H
    cmp al,0dh       ; 检测回车
    jz done
    cmp al,30h       ;检测数字和小写字母
    jb next
    cmp al,29h       ;检测大写字母
    ja charup
    mov dl,al
    mov ah,2h
    int 21H
    jmp START
charup:
    cmp al,41h
    jb next
    cmp al,5ah
    ja chardown
printc:
    mov dl,63h
    mov ah,2h
    int 21H
    jmp START
chardown:
    cmp al,61h
    jb next
    cmp al,7ah
    ja next
    jmp printc
next:
    jmp START
done:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START