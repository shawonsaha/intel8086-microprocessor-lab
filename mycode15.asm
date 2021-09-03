.MODEL SMALL
.STACK 100H
.DATA
STRING DB 5 DUP(?)
MSG DB 'AX * BX = $'  
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    ;NUMBER YOU WANT TO MULTIPLY 
    
    MOV AX, 15       ;STORE NUMBER IN AX
    
    ;HOW MANY REPEATIONS YOU WANT
    
    MOV BX, 10       ;STORE NUMBER IN BX
                                 
    
    MOV CX,BX
    MOV BX,AX                             
    SUB CX, 1       ;SUBTRACTION (N-1) BECAUSE AX * BX == AX * BX+1
    

    L1:
      ADD AX,BX
      LOOP L1

    ;CONVERTING 16 BIT HEX VALUE TO DECIMAL AND PRINT
    
    PUSH BX                 ;; RESERVING BX AND CX FOR LATER USE BY PUSHIN STACK
    PUSH CX
    LEA SI, STRING
    
    MOV BX, 10              ;; STORING 2 DIGITS NUMBER AS CHARACTER IN STRING
    XOR CX, CX
    DIVISION: XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE DIVISION
    STORE: POP DX
    ADD DL, 48
    MOV [SI], DL
    INC SI
    LOOP STORE
    MOV [SI], '$ '
    
    POP CX
    POP BX
    
    LEA DX, MSG
    MOV AH, 9
    INT 21H
    
    LEA DX, STRING         ;;GET THAT 2 DIGIT NUMBER WHICH IS CHARACTER FROM STRING
    MOV AH, 9
    INT 21H

    MAIN ENDP
END MAIN