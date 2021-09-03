.MODEL SMALL
.STACK 100H
.DATA
TEXT1 DB 10,13,'ENTER A HEX DIGIT: $'
TEXT2 DB 10,13,'IN DECIMAL IT IS $'
TEXT3 DB 10,13,'DO YOU WANT TO DO IT AGAIN? : $'
TEXT4 DB 10,13,'ILLEGAL CHARACTER, INSERT AGAIN: $'


.CODE   


RETRY:

    MOV AX,@DATA
    MOV DS,AX
    LEA DX,TEXT1
    MOV AH,9
    INT 21H
   
    MOV AH,1
    INT 21H
   
    MOV BL,AL 
   
    JMP PROCEED
   
   
PROCEED:   

    CMP BL,'9'
    JA ATOF
    JB ZEROTONINE
    JE ZEROTONINE
           
       
ATOF:

    CMP BL,'F'
    JA NOTAHEX  
    
    
    LEA DX,TEXT2 
    MOV AH,9
    INT 21H
   
    MOV DL,49D
    MOV AH,2
    INT 21H
    
    SUB BL,17D
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    JMP USERINPUT
       
    
USERINPUT:
    
    LEA DX,TEXT3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV CL,AL
    CMP CL,'y'
    JE RETRY
    CMP CL,'Y'
    JE RETRY
    JMP EXIT
    
   
ZEROTONINE:
   
    CMP BL,'0'
    JB NOTAHEX
   
    LEA DX,TEXT2 
    MOV AH,9
    INT 21H 
       
    MOV DL,BL
    MOV AH,2
    INT 21H
   
    JMP USERINPUT
   
      
NOTAHEX:

    LEA DX,TEXT4
    MOV AH,9
    INT 21H
       
    MOV AH,1
    INT 21H
       
    MOV BL,AL 
    JMP PROCEED
       
       
EXIT: