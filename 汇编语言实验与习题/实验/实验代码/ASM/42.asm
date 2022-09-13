DATA    SEGMENT
    BUF DB  38H,73H,1FH
    MIN DB  ?
    DATA    ENDS
    CODE    SEGMENT
        ASSUME  CS:CODE,DS:DATA
    START:  MOV AX,DATA
        MOV DS,AX
        MOV AL,BUF
        CMP AL,BUF+1                   ;AL>=BUF+1（即比较BUF中的第一个数与第二
        JB LP1                                                             ;个数的大小）则跳转到LP1
        MOV AL,BUF+1
    LP1:    
        CMP AL,BUF+2
        JB LP2                        ;AL>=BUF+2（即比较BUF中的第二个数与第三个数的 
        MOV   AL,BUF+2                                      ;大小）则跳转到LP2
    LP2:
        MOV MIN,AL                 ;把三个数种最大的数给MAX
        MOV AH,4CH
        INT 21H
    CODE    ENDS
    END START