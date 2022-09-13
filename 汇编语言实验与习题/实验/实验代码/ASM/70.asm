DATA SEGMENT
	PROMPT  DB 0DH, 0AH, 'Input a lowercase letter: $'	;输入提示信息
	ERR_MSG DB 0DH, 0AH, 'Input error . $'             	;输入错误警告信息
	BUF     DB 0DH, 0AH, 'Prev: '                      	;输出缓冲区
	PREV    DB 20H
	        DB 0DH, 0AH, 'Succ: '
	SUCC    DB 20H
	        DB 0DH, 0AH, '$'
       DATA ENDS
CODE SEGMENT
	      ASSUME CS: CODE, DS: DATA
	START:MOV    AX, DATA
	      MOV    DS, AX
	INPUT:LEA    DX, PROMPT
	      MOV    AH, 9
	      INT    21H               	;输出提示信息
	      MOV    AH, 1
	      INT    21H               	;输入一个字符
	      CMP    AL, 'a'           	;输入正确性检查
	      JB     ERROR
	      CMP    AL, 'z'
	      JA     ERROR
	      MOV    BL, AL            	;计算“前导”字母
	      DEC    BL
	      CMP    BL, 'a'
	      JB     SKIP1             	;“前导”非字母,跳过
	      MOV    PREV, BL          	;保存“前导”字母
	SKIP1:INC    AL                	;计算“后继”字母
	      CMP    AL, 'z'
	      JA     SKIP2             	;“后继”非字母,跳过
	      MOV    SUCC, AL          	;“后继”为字母,保存
	SKIP2:LEA    DX, BUF           	;输出“前导”和“后继”字母
	      MOV    AH, 09H
	      INT    21H
	      JMP    EXIT              	;跳过出错处理程序
	ERROR:LEA    DX, ERR_MSG       	;显示出错信息
	      MOV    AH, 09H
	      INT    21H
	      JMP    INPUT             	;要求重新输入
	EXIT: MOV    AX, 4C00H         	;返回OS
	      INT    21H
       CODE ENDS
       END START