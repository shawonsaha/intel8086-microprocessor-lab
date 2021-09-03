.MODEL SMALL
.STACK 100H

.DATA 
PROMPT1 DB 'Enter First Number: $'
PROMPT2 DB 'Enter Second Number: $'
MSG DB 'numbers that are divisible by 5 within that range is: $'

.CODE
MAIN PROC  
   MOV AX,@DATA
   MOV DS,AX
   
   ;BEGIN
   
   ;DISPLAY PROMPT1
   LEA DX, PROMPT1
   MOV AH, 9
   INT 21H
       
   MOV AH,1
   INT 21H
   MOV BL,AL
   SUB BL,30H
   
   ;New Line
   MOV AH,2
   MOV DL,0DH
   INT 21H
   MOV DL,0AH
   INT 21H
   
   ;DISPLAY PROMPT2
   LEA DX, PROMPT2
   MOV AH, 9
   INT 21H
   
   MOV AH,1
   INT 21H
   SUB AL,30H
   MOV CL,AL    
   
   ;User Input
   MOV AH,2
   MOV DL,0DH
   int 21H

   MOV DL,0AH
   INT 21H
   
   ;Prompt
   MOV AH,9
   LEA DX,MSG
   INT 21H 
   
   JMP BEGIN    
   
   BEGIN: 
   CMP BL,CL
   JG EXIT
   
   MOV AX,BX 
   MOV DL,5H
   
   
   DIV DL
   
   CMP AH,00
   JE OUTPUT
   
   INC BL 
   JMP BEGIN
       
   OUTPUT: 
   MOV DL,BL
   ADD DL,30H
   MOV AH,2
   
   INT 21H  
   
   INC BL
   JMP BEGIN
   
   
   EXIT:
   MOV AX,4C00H
   INT 21H                         
   MAIN ENDP
      END MAIN