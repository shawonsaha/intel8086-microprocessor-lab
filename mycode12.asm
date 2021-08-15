.MODEL SMALL
.STACK 100H
.DATA

A DB '1st Side: $'
B DB '2nd Side: $'
C DB '3rd Side: $'
D DB '4th Side: $'

output db "$"
    y db "Y$"
    n db "N$" 
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    ;Taking 4 input from user

    ;Promt
    MOV AH,9
    LEA DX,A
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
    LEA DX,B
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
    LEA DX,C
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV CH,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;Promt
    MOV AH,9
    LEA DX,D
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
    
    
    
    CMP BH,BL         ;Compare between input 1 and 2
    JE first2equal    ;If 1st and 2nd input equal
    JG printNO        ;Otherwise Print NO and Exit
    JL printNO
    
    JMP EXIT
    
    first2equal:
    CMP BL,CH
    JE second2equal   ;If 2nd and 3rd input equal
    JG printNO
    JL printNO
    
    second2equal:
    CMP CH,CL
    JE third2equal    ;If 3rd and 4th input equal
    JG printNO
    JL printNO
    
    third2equal:
    JE printYES       ;Print YES
    JG printNO
    JL printNO
    
    ;;;Print;;;
      
   printYES:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, y
        mov ah, 9
        int 21h
        jmp exit
        
    printNO:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, n
        mov ah, 9
        int 21h
        jmp exit    
    
    EXIT:
    
    
    
    MAIN ENDP
END MAIN