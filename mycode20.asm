.MODEL SMALL
.DATA

PRMPT1 DB 10,13,"Input 1 : $"
PRMPT2 DB 10,13,"Input 2 : $"

;STORING USER INPUT
NUM1 DW ?
NUM2 DW ?

;NECESSARY MULTIPLICATION VALUES FOR STORING 4 DIGIT NUMBER
A DW 1000
B DB 100
C DB 10

;OUTPUT MESSAGES
MSG1 DB 10,13,"palindrome$"
MSG2 DB 10,13,"Not palindrome$"

;TEMP AND ARRAY DB FOR INNER PROCESSING
TEMP DB ?
PRODUCT DW ?
INST DB DUP(0)

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

MOV AH,9H
LEA DX,PRMPT1
INT 21H                     ;TAKING FIRST 4 DIGIT (16 BIT) INPUT

MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
MUL A
MOV NUM1,AX                 ;1ST DIGIT

MOV AH,1
INT 21H
SUB AL,30H
MUL B
ADD NUM1,AX                 ;2ND DIGIT

MOV AH,1
INT 21H
SUB AL,30H
MUL C
ADD NUM1,AX                 ;3RD DIGIT

MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
ADD NUM1,AX                 ;4TH DIGIT


MOV AH,9H
LEA DX,PRMPT2
INT 21H                     ;TAKING LAST 4 DIGIT (16 BIT) INPUT

MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
MUL A
MOV NUM2,AX                 ;1ST DIGIT

MOV AH,1
INT 21H
SUB AL,30H
MUL B
ADD NUM2,AX                 ;2ND DIGIT

MOV AH,1
INT 21H
SUB AL,30H
MUL C
ADD NUM2,AX                 ;3RD DIGIT

MOV AH,1
INT 21H
SUB AL,30H
MOV AH,0
ADD NUM2,AX                 ;4TH DIGIT

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H                     ;NEW LINE


MOV  AX,NUM2
ADD  AX,NUM1                ;ADDING INPUT 1 WITH 2
XOR  CX,CX                  ;COUNTS THE DIGITS
MOV  BX,10                  ;FIXED DIVIDER

MORE:
    XOR  DX,DX              ;WORD DIVISION NEEDS TO ZERO DX!
    DIV  BX
    PUSH DX                 ;REMAINDER [0,9]
    INC  CX                 ;ONE DIGIT MORE
    TEST AX,AX
    JNZ  MORE               ;CONTINUE UNTIL AX IS EMPTY

    MOV BX,0

NEXT:
    POP  DX
    ADD  DL,48              ;TURN INTO A CHARACTER, FROM [0,9] TO ["0","9"]
    MOV  AH,02H             ;DOS DISPLAYCHARACTER FUNCTION
    INT  21H                ;PRINT EACH DIGIT ON THE SCREEN

    MOV [INST+BX],AL        ;STORING EACH DIGIT OF SUM IN ARRAY
    INC BX                  ;INCREMENT INDEX

    LOOP NEXT               ;CONTINUE FOR ALL DIGITS

    MOV DI,0
    MOV CX,5
    DEC BX

STARTCHECK:                 ;TRAVERSE FORWARD AND BACKWARD AT A TIME
    MOV AL,[INST+BX]
    DEC BX
    MOV TEMP,AL
    MOV AL,[INST+DI]
    INC DI
    CMP AL,TEMP             ;COMPARE EACH DIGIT
    JNZ NOTPALINDROME       ;SINGLE MISMATCH == NOT PALINDROME
    LOOP STARTCHECK         ;OTHERWISE CONTINUE CHECKING

PALINDROME:
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    JMP EXIT

NOTPALINDROME:
    LEA DX,MSG2
    MOV AH,09H
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H
END MAIN