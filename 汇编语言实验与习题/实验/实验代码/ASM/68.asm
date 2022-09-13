DATA SEGMENT
	ARRAY DB 20 DUP(0FFH)	;定义数组ARRAY
DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:MOV    AX, DATA
	      MOV    DS, AX
	      LEA    BX, ARRAY         	;把数组ARRAY首地址装入BX
	      MOV    CX, 20            	;装载循环计数器的初始值
	ONE:  MOV    BYTE PTR [BX], 0  	;把数组ARRAY的一个元素清零
	      INC    BX                	;修改BX的值,为下一次操作做准备
	      LOOP   ONE               	;计数循环
	      MOV    AX, 4C00H
	      INT    21H
CODE ENDS

END START