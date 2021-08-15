.MODEL SMALL
.STACK 100H
.DATA
A DB 'Enter First Initial: $'
B DB 'Enter Second Initial: $'
C DB 'Enter Third Initial: $'
.CODE


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

;start
    
    ;Promt
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BL,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    ;Promt
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    ;Promt
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;First Input
    MOV DL,BL
    INT 21H
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;Second Input
    MOV DL,BH
    INT 21H
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;Third Input
    MOV DL,CL
    INT 21H





    MAIN ENDP
END MAIN