DATA SEGMENT
    X     DB -03H
    WORD1 DB 'Y=0',0DH,0AH,'$'
    WORD2 DB 'Y=-1',0DH,0AH,'$'
    WORD3 DB 'Y=1',0DH,0AH,'$'            
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AL,X
    MOV BL,00H
    CMP AL,BL      ;先判断是否为0
    JZ  LP1
    JMP LP2
LP1:    MOV DX,OFFSET WORD1
    MOV AH,09H                   
    INT 21H
    MOV CL,00H      ;Y的值保存在CL中
    JMP LP5
LP2:    CMP AL,BL   ;不为0，则与0比较，
    JL  LP3         ;< 0跳到LP3,否则，跳到LP4（>0）
    JMP LP4
LP3:    MOV DX,OFFSET WORD2
    MOV AH,09H                   
    INT 21H
    MOV CL,-01H
    JMP LP5
LP4:    MOV DX,OFFSET WORD3
    MOV AH,09H                   
    INT 21H
    MOV CL,01H
LP5:    MOV AH,4CH
    INT 21H         
CODE ENDS
    END START