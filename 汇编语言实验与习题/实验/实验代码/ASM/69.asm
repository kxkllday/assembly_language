DATA SEGMENT
	LIST DW 20, 25, 70, 15, 200, 30, 75, 108, 90, 36	;定义数组LIST
	SUM  DW ?                                       	;SUM存放累加和
DATA ENDS
CODE SEGMENT
	      ASSUME DS: DATA, CS: CODE
	START:MOV    AX, DATA
	      MOV    DS, AX
	      MOV    BX, 0             	;BX是数组元素在数组内的位移,初值0
	      MOV    CX, 10            	;装载循环计数器的初始值
	      MOV    AX, 0             	;累加器AX清零
	ONE:  ADD    AX, LIST[BX]      	;把数组LIST的一个元素加入AX中
	      INC    BX                	;修改BX的值,为下一次操作做准备
	      INC    BX
	      LOOP   ONE               	;计数循环
	      MOV    SUM, AX           	;保存结果（累加和）
	      MOV    AX, 4C00H
	      INT    21H
CODE ENDS
END START