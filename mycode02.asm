
.MODEL SMALL  

.STACK 100H

.DATA   

P DB 18H
Q DB 10H
R DB 15H    
  
.CODE   
MAIN PROC   
    
    
MOV AX , @DATA 
MOV DS , AX
 


MOV BL,P
MOV CL,Q    
MOV DL,R
 
 
ADD DL,BL ;storing data into DL where DL = (P+R)  
SUB DL,CL ;storing data into DL where DL = (P+R) - Q
MOV CL,DL ;storing data into CL where CL = (P+R) - Q


  
  
  
 
MOV AX,4C00H  
INT 21H 

MAIN ENDP 
  END MAIN 