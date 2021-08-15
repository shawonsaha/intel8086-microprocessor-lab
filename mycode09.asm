.MODEL SMALL
.STACK 100H
.DATA 
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BH,AL     
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    
    CMP BH,BL         ;Compare between input 1 and 2
    JG bigOfFirst2    ;If input 1 is greater than input 2
    JL smallOfFirst2  ;If input 1 is smaller than input 2 
    
    JMP EXIT  
    
    
    bigOfFirst2:
    CMP BH,CL         ;Compare between input 1 and 3
    JL printBH        ;If input 1 is less than input 3 print input 1
    JG comp2and3      ;If input 1 is greater than input 3 compare input 2 and 3
    
    JMP EXIT  
     
      
     
    smallOfFirst2:
    CMP BH,CL          ;compare between input 1 and 3
    JG printBH         ;if input 1 is bigger than 3 print input 1
    JL comp2and3Alt    ;if input 1 is smaller than input 2 compare input 2 and 3
    
    JMP EXIT     
    
    
    ;;2nd comparison;;
    
    comp2and3:
    CMP BL,CL
    JG printBL
    JL printCL
    
    JMP EXIT
    
    comp2and3Alt:
    CMP BL,CL
    JG printCL
    JL printBL
    
    
    
    ;;;Print;;;
    
    
   printBL:
    mov ah,2
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h 
    
    MOV DL,BL
    
    MOV AH,2
    INT 21H
    JMP EXIT  
    
    
   printCL: 
    mov ah,2
    mov dl,0dh
    int 21h

    mov dl,0ah
    int 21h 
    
    MOV DL,CL
    
    MOV AH,2
    INT 21H
    JMP EXIT
       
    
   printbh: 
    mov ah,2
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h 
    
    MOV DL,BH
    
    MOV AH,2
    INT 21H
    JMP EXIT
    
    EXIT:
    
    
    
    MAIN ENDP
END MAIN