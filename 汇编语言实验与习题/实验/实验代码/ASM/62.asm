CODE SEGMENT
	       ASSUME CS: CODE, DS: CODE
	START: MOV    AX, CODE
	       MOV    DS, AX
	       LEA    DX, STRING
	       MOV    AH, 9
	       INT     21H
	       MOV    AX, 4C00H
	       INT    21H
	STRING DB     0AH, 0DH, 'Hello !', 0AH, 0DH, '$'
             CODE ENDS
             END START