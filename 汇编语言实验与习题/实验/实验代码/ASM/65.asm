DATA SEGMENT
	SUM  DB ?
    C10  DB 10
       DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:MOV    AX, DATA
	      MOV    DS, AX
	      MOV    CX, 5             	;循环次数
	      MOV    SUM, 0            	;累加器清零
	ONE:  MOV    AH, 1             	;输入单个字符的功能号
	      INT    21H               	;输入一个字符，ASCII码在AL中
	      AND    AL, 0FH           	;ASCII码转换成二进制数
	      ADD    SUM, AL           	;累加
	      LOOP   ONE               	;计数与循环
          MOV    AH,2
          MOV    DL,0DH
          INT    21H 
          MOV    DL,0AH
          INT    21H 
          MOV    CX, 3             	;循环次数
	      MOV    AL, SUM
	ONE1:  MOV    AH, 0             	;高8位清零
	      DIV    C10               	;执行除法
	      PUSH   AX                	;把余数（在AH中）压入堆栈
	      LOOP   ONE1
	      MOV    CX, 3             	;重新装载CX
	TWO:  POP    DX                	;从堆栈中弹出余数（在DH中）
	      XCHG   DH, DL            	;把余数交换到DL
	      OR     DL, 30H           	;转换成数字的ASCII代码
	      MOV    AH, 2
	      INT    21H               	;向显示器输出一个字符
	      LOOP   TWO
	      MOV    AX, 4C00H
	      INT    21H
       CODE ENDS
       END START