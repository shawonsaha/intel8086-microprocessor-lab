                       
.MODEL SMALL  

.STACK 100H

.DATA   
       
A DW 1
B DW 2
C DW 3
D DW 5
E DW 0 
  
.CODE   
MAIN PROC   
    
    
MOV AX , @DATA 
MOV DS , AX
 


;MOV AL,A
;DIV B 
;MOV BL,B
;SUB BL,AL
        
        
MOV AX,A  
ADD AX,B ;(1+2)
MOV BX,C
SUB BX,A ;(3-1)
DIV BX
MUL D
SUB AX,C
ADD AX,B
MOV BX,AX
MUL E
MOV AX,A
DIV B
SUB BX,AX

 
;MOV AX,4C00H  
;INT 21H 

MAIN ENDP 
  END MAIN 




