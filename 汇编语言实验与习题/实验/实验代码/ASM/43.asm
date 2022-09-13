DATA    SEGMENT
COUNT   DB  07H
BUF DB  38H,-5H,32H,44H,10H,-02H
STRING1 DB  'FUSHU',0DH,0AH,'$'
STRING2 DB  'ZHENGSHU',0DH,0AH,'$'
DATA    ENDS
CODE    SEGMENT
    ASSUME  CS:CODE,DS:DATA
START:  MOV AX,DATA
    MOV DS,AX
    MOV     AL,00H
    MOV     CL,00H
    MOV     SI,OFFSET BUF
LP0:    MOV BL,[SI]
    INC SI
    INC     CL
    CMP     CL,COUNT        
    JNL     LP4              
    CMP     AL,BL          
    JNL     LP1          
    JMP     LP2
LP1:    MOV     DX,OFFSET STRING1  
    MOV AH,09H
    INT 21H
    JMP     LP0
LP2:    MOV     DX,OFFSET STRING2  
    MOV AH,09H
    INT 21H
    JMP     LP0
LP4:    MOV AH,4CH
    INT 21H 
CODE ENDS
    END START