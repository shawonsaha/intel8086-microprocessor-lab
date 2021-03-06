.MODEL SMALL
.STACK 100H
.DATA 

TXT1 DB 'ENTER 5 NUMBERS: $'   
INPUT_ARRAY DB 10 DUP(0)

.CODE 
MAIN PROC 

MOV AX,@DATA 
MOV DS,AX 

LEA DX,TXT1
MOV AH,9
INT 21H

MOV CX,5
MOV AH,1
MOV SI,0
 
STORING:
    INT 21H
    MOV INPUT_ARRAY[SI],AL
    ADD SI,1
    LOOP STORING

MOV CX,5
DEC CX 

SORT:
    MOV BX,CX
    MOV SI,0

SORTING:
    MOV AL,INPUT_ARRAY[SI]
    MOV DL,INPUT_ARRAY[SI+1]
    CMP AL,DL
    JC INDEXING
    MOV INPUT_ARRAY[SI],DL
    MOV INPUT_ARRAY[SI+1],AL

INDEXING:
    INC SI
    DEC BX
    JNZ SORTING
    
    LOOP SORT
    
MOV AH,2
MOV DL,10
INT 21H
MOV DL,13
INT 21H

MOV CX,5
MOV AH,2
MOV SI,0    

RESULT:
    MOV DL,INPUT_ARRAY[SI]
    INT 21H
    ADD SI,1
    LOOP RESULT 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN