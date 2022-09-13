DATA SEGMENT
	X    DB 10110111B
	C10  DB 10
               DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:
	      MOV    AX, DATA
	      MOV    DS, AX
	      MOV    CX, 3             	;循环次数
	      MOV    AL, X
	ONE:  MOV    AH, 0             	;高8位清零
	      DIV    C10               	;执行除法
	      PUSH   AX                	;把余数（在AH中）压入堆栈
	      LOOP   ONE
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