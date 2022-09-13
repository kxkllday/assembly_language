DATA SEGMENT
	BUFFER DB 6, ?, 6 DUP(?)
	C10    DW 10
	X      DW ?
       DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:MOV    AX, DATA
	      MOV    DS, AX
	      LEA    DX, BUFFER        	;装载输入缓冲区首地址
	      MOV    AH, 0AH           	;行输入功能代号
	      INT    21H               	;从键盘输入一个数,以回车键结束
	      MOV    AX, 0             	;累加器清零
	      MOV    CL, BUFFER+1      	;循环次数
	      MOV    CH, 0
	      LEA    BX, BUFFER+2      	;装载字符存放区首地址
	ONE:  MUL    C10               	;P=P×1
	      MOV    DL, [BX]          	;取出一个字符
	      AND    DL, 0FH           	;转换成二进制数
	      ADD    AL, DL            	;累加
	      ;ADC    AH, 0
	      INC    BX                	;修改指针
	      LOOP   ONE               	;计数与循环
	      MOV    X, AX             	;保存结果
	      MOV    AX, 4C00H
	      INT    21H
       CODE ENDS
       END START