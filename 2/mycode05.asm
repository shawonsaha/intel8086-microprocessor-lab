.MODEL SMALL

.STACK 100h

.DATA

NUM1 DB ?
NUM2 DB ?
RESULT DB ?

a db "The result is$"

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

;start code here

mov ah,1
int 21h
sub al,30h
mov NUM1,al

;NEW LINE
MOV AH,2
MOV DL,0DH 
INT 21H 
MOV DL,0AH 
INT 21H 

mov ah,1
int 21h
sub al,30h
MOV NUM2,al

mul NUM1 

mov RESULT, al

AAM

ADD AH,30H
ADD AL,30H
MOV BX,AX   

;NEW LINE
MOV AH,2
MOV DL,0DH 
INT 21H 
MOV DL,0AH 
INT 21H

LEA dx,a
mov ah,9
int 21h

;NEW LINE
MOV AH,2
MOV DL,0DH 
INT 21H 
MOV DL,0AH 
INT 21H

MOV AH,2
MOV DL,BH
INT 21H 

MOV AH,2
MOV DL,BL
INT 21H 

; end code here

MOV AX, 4C00H
INT 21H

MAIN ENDP
    END MAIN