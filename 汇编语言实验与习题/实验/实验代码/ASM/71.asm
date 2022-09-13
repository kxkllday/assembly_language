DATA SEGMENT
    FIBLST DW  1, 1, 18 DUP (?)
    N DW 20   
    DATA ENDS
CODE SEGMENT
    ASSUME CS: CODE, DS: DATA
    START: MOV AX,DATA
    MOV DS,AX
    LEA SI,FIBLST
    MOV CX,N
    SUB CX,2
ONE:MOV AX,[SI+2]
    MOV BX,[SI]
    CALL FIB
    MOV [SI+4], AX
    ADD SI,2
    LOOP ONE
    MOV AX,4C00H
    INT 21H
;子程序FIB
;功能：求菲波那契数列数列的一项
;入口参数：AX＝Xi-1，BX＝Xi-2
;出口参数：AX＝Xi-1+Xi-2=（Xi）
FIB PROC
    ADD AX,BX
    RET
    FIB ENDP
       CODE ENDS
       END START
