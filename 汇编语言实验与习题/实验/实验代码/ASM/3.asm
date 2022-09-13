DATAS SEGMENT
    x dw 1h
    y dw 0123h
    z dw 0234h
    v dw 0345h 
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov ax,x
    imul y ;Multiplies ax by the operand (Signed).    会相应扩展位数，比如被乘数在ax，乘数是16位，结果在dx:ax中
    mov cx,ax
    mov bx,dx
    mov ax,z
    cwd       ;Change Word to Double word
    add cx,ax
    add bx,dx
    sub cx,540
    sbb bx,0   ;带借位减法  操作对象1 = 操作对象1 - 操作对象2 - CF
    mov ax,v
    cwd
    sub ax,cx
    sbb dx,bx   ;被除数: 如果除数是8位则被除数为16位, 默认放在AX中, 如果除数是16位, 则被除数为32位, 默认高位放在DX, 低位放在AX
    idiv x     ;如果除数是8位, 那么执行div后, 余数存放在AH, 商存放在AL中; 如果除数是16位, 那么AX保存商, DX保存余数,注意: 被除数的位数一定是除数的两倍
    jz
    jo
    add
    sub
    mul
    jb 
    imul
    mul
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START