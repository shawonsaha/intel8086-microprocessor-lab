                        

.MODEL SMALL  

.STACK 100H

.DATA   
       
A DW 15H
B DB 3H
C DB 2H    
  
.CODE   
MAIN PROC   
    
    
MOV AX , @DATA 
MOV DS , AX
 

   
MOV AX,A  ;store A into AX (mandatory)
MOV BL,B  ;store B into BL
DIV BL    ;A/B value will be store in AL
MOV CL,C  ;store C into CL
MUL CL    ;Multiplying CL with AL (C*(A/B))


  
  
  
 
;MOV AX,4C00H  
;INT 21H 

;MAIN ENDP 
  ;END MAIN 




