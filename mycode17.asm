.MODEL SMALL
.DATA
        
TXT1 DB "Enter Name:$"
TXT2 DB 0AH,0DH, "Output:$"
INPUT_ARRAY DB 60 DUP('$')
RESULT_ARRAY DB 60 DUP('$') 

.CODE
    MOV AX,@DATA    
    MOV DS,AX

    ;Prompt    
    LEA DX,TXT1
    MOV AH,09H
    INT 21H
    
    ;User Input
    LEA DX,INPUT_ARRAY   
    MOV AH,0AH        
    INT 21H        
    
    ;Start Processing          
    MOV AL,INPUT_ARRAY[01]
    MOV CL,AL        
    CALL CASE
             
    ;Show Output Result    
    LEA DX,TXT2
    MOV AH,09H
    INT 21H
    MOV DI,00
    LEA DX,RESULT_ARRAY[DI]
    MOV AH,09H          
    INT 21H
     
    MOV AH,4CH
    INT 21H


CASE PROC
    MOV SI,02         
    MOV DI,00
                 
    CASE1:
        MOV AL,INPUT_ARRAY[SI] 
        CMP AL,'A'         
        JL CASE4             
        CMP AL,'Z'         
        JLE CASE3
      
        CMP AL,'a'         
        JL CASE4             
        CMP AL,'z'         
        JG CASE4             
        SUB AL,20H        
     
    CASE2:
        MOV RESULT_ARRAY[DI],AL      
        INC DI              
        INC SI                               
        CMP CL,00
        JNZ CASE1
        
    CASE3:
        ADD AL,20H          
        MOV RESULT_ARRAY[DI],AL      
        INC DI              
        INC SI               
        DEC CL               
        CMP CL,00
        JNZ CASE1
       
    CASE4:
        CMP AL,20H
        JE CASE2
        RET
      
CASE ENDP
END