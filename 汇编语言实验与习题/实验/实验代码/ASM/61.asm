CODE SEGMENT
ASSUME CS: CODE
START: LEA    BX, STRING
	    MOV    CX, 10
ONE:    MOV    DL, CS: [BX]                 	;取出一个字符的ASCII代码
        MOV    AH, 2                        	;单个字符输出的功能号
	    INT    21H                          	;调用系统服务,输出一个字符
	    INC    BX                           	;修改指针
	    LOOP   ONE                          	;计数与循环控制
	    MOV    AX, 4C00H
	    INT    21H
STRING  DB     0DH, 0AH,'Hello!', 0DH, 0AH
CODE ENDS
END START