DATA SEGMENT
	SUM    DB ?
	BUFFER DB 6, ?, 6 DUP(?)
      DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:MOV    AX, DATA
	      MOV    DS, AX
	      LEA    DX, BUFFER        	;装载输入缓冲区首地址
	      MOV    AH, 0AH           	;行输入功能代号	
	      INT    21H               	;调用系统服务
	      MOV    SUM, 0            	;累加器清零
	      MOV    CL, BUFFER+1      	;循环次数
	      MOV    CH, 0
	      LEA    BX, BUFFER+2      	;装载字符存放区首地址
	ONE:  MOV    AL, [BX]          	;取出一个字符
	      AND    AL, 0FH           	;ASCII码转换成二进制数
	      ADD    SUM, AL           	;累加
	      INC    BX                	;修改指针
	      LOOP   ONE               	;计数与循环
	      MOV    AX, 4C00H
	      INT    21H
       CODE ENDS
       END START