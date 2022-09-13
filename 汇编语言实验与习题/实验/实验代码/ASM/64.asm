DATA SEGMENT
	Y    DW 0100101010110111B
	C16  DW 16
	HEX  DB '0123456789ABCDEF'
    DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:MOV    AX, DATA
	      MOV    DS, AX
	      MOV    CX, 4             	;循环次数
	      MOV    AX, Y
	ONE:  MOV    DX, 0             	;高16位清零
	      DIV    C16               	;执行32b÷16b除法,余数在DX中
	      PUSH   DX                	;把余数压入堆栈  
	      LOOP   ONE               	;第一个循环计数控制
	      MOV    CX, 4             	;重新装载CX
	      LEA    BX, HEX           	;表的首地址装入BX
	TWO:  POP    AX                	;从堆栈中弹出余数
	      XLAT                     	;操作是以DS:[BX+AL]为地址，提取存储器中的一个字节再送入AL。
	      MOV    DL, AL            	;转移到DL中
	      MOV    AH, 2
	      INT    21H               	;向显示器输出一个字符
	      LOOP   TWO               	;第二个循环计数控制
	      MOV    AX, 4C00H
	      INT    21H
                 CODE ENDS
                 END START