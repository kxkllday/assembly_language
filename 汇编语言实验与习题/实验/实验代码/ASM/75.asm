DATAS SEGMENT
    ;此处输入数据段代码
    BUF DW 0,8200h,42h,0fffh,1200h,3203h,0c000h,9030h,6800h,10h,08h,222h
    SUM DB ?
    C10  DB 10
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    MOV AX,0
    MOV SUM,0
    MOV SI,OFFSET BUF
    MOV CX,12
ONE1:
    CMP [SI],AX
    JNL TWO1
    INC SUM
TWO1:
    ADD SI,2
    LOOP ONE1
    ;输出模块
          MOV    CX, 3             	;循环次数
	      MOV    AL, SUM
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
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START