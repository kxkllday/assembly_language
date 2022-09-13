DATA SEGMENT
       FIBLST DW 1, 1, 18 DUP(?)
       N DW 20   
       XI1 DW ?
       XI2 DW ?
       XI DW ?
       DATA ENDS
CODE SEGMENT
        ASSUME CS: CODE, DS: DATA
         START:MOV AX,DATA
               MOV DS,AX
               LEA SI,FIBLST                           ; 设置地址指针
               MOV CX,N
               SUB CX,2                                     ; 设置计数器初值
          ONE: MOV AX, [SI]       
               MOV XI2, AX                              ; Xi-2置入XI2
               MOV AX, [SI+2]
               MOV XI1, AX                              ; Xi-1置入XI1
               CALL FIB                                    ; 调用子程序
               MOV  AX, XI                               ; 取出子程序计算结果
               MOV  [SI+4], AX                         ; 取出Xi，置入FIBLST数组
               ADD SI,2                                      ; 修改地址指针
               LOOP ONE                                  ; 循环控制
               MOV AX,4C00H
               INT 21H
      ;子程序FIB
      ;功能：计算菲波那契数列数列的一项
      ;入口参数：XI1＝XI-1，XI2＝XI-2
      ;出口参数：XI＝XI-1+XI-2
      FIB PROC
          PUSH AX                                          ; 保护现场
          MOV AX,XI1                                   ; AX＝XI-1
          ADD AX,XI2                                    ; AX＝XI-1+XI-2
          MOV XI, AX                                    ; XI ← AX
          POP AX                                            ; 恢复现场
          RET
      FIB ENDP
       CODE ENDS
       END START