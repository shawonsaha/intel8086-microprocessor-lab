.model small


.data
        RESULT DB ?     
        divisible db 0ah,0dh,"Divisible$"
        ndivisible db 0ah,0dh,"Not divisible$"
        input1 db '1st input: $'
        input2 db '2nd input: $'
        ;RESULT db 0ah,0dh,"Result is $"  
          

.code
        MOV AX,@data         
        MOV DS,AX
     
        
        ;First Input  
        ;Promt
        MOV AH,9
        LEA DX,input1
        INT 21H
        
        ;User Input
        MOV AH,1
        INT 21H
        SUB AL,48
        MOV BL,AL
        
        ;New Line                  
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        ;Promt
        MOV AH,9
        LEA DX,input2
        INT 21H
        
        ;User Input
        MOV AH,1
        INT 21H
        SUB AL,48
        MOV CL,AL
        
        ;New Line                  
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H          
        
        ;Multiplying first input with second input
        MOV AL,CL
        MUL BL
        
        MOV RESULT, BL
        
        ;Saving multiplication to CL
        MOV CL,AL
        MOV AL,CL
        MOV BH,4
        DIV BH   ;Dividing Multplied Value (Stored in AL) by 4.
        
        MOV BL,0
        cmp AH,BL
        JE ND
        
        LEA DX,ndivisible
        MOV AH,9
        INT 21H
        JMP EXIT
         
     ND:   
        MOV AX,0
        MOV AL,CL
        MOV BH,6
        DIV BH      
      
        MOV BH,0
        CMP AH,BH
        JE D
           
        LEA DX,ndivisible
        MOV AH,9
        INT 21H
        JMP EXIT               
     D:
        LEA DX,divisible
        MOV AH,9
        INT 21H
        JMP EXIT
      
     EXIT:
        MOV AH,4cH             
        INT 21H
End