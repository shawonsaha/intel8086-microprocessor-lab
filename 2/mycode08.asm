.MODEL SMALL
.STACK 100H
.DATA
A DB 'ENTER A HEX DIGIT:$'
B DB 'IN DECIMAL IT IS $'
.CODE


MAIN PROC 

    MOV AX,@DATA
    MOV DS,AX
    
    ;Promp
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;Converting to Decimal
    SUB BL, 11H
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;Prompt
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;Printing Result
    MOV AH,2
    MOV DL,31H
    INT 21H
    MOV DL,BL
    INT 21H


    MAIN ENDP
END MAIN