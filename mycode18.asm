ORG 100H

.DATA
INP1 DB "Enter Three numbers: $" 
INP2 DB " $" 
INP3 DB " $"
RESULT DB 0AH,0DH, "Largest Number: $"


.CODE 
    ;First Input
    LEA DX,INP1
    MOV AH,9
    INT 21H
    ;Storing Input in BL
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    ;2nd Input
    LEA DX,INP2
    MOV AH,9
    INT 21H
    ;Storing Input in BH
    MOV AH,1
    INT 21H
    MOV BH,AL
     
    ;3rd Input
    LEA DX,INP3
    MOV AH,9
    INT 21H 
    ;Storing Input in CL
    MOV AH,1
    INT 21H
    MOV CL,AL


COMPARE1:
    CMP BL,BH
    JG COMPARE2
    JMP COMPARE3

COMPARE2:
    CMP BL,CL
    JG PRNT1 
    JMP PRNT3

COMPARE3:
    CMP BH,CL
    JG PRNT2 
    JMP PRNT3


PRNT1: 
    LEA DX,RESULT
    MOV AH,9
    INT 21H

    MOV AH,2
    MOV DL,BL
    INT 21H
    
    JMP END

PRNT2:
    LEA DX,RESULT
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    JMP END

PRNT3: 
    LEA DX,RESULT
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    JMP END

END: