# intel8086-microprocessor-lab
**01**
![Lab 01 Task 01](https://i.ibb.co/B4wP4PF/Screenshot-20210815-155338.png "Lab 01 Task 01")
```
    ADD AL,3H
    ADD BL,1H
    ADD CL,0H
    ADD DL,0H
    ADD CL,AL
    ADD DL,BL
    ADD AL,BL
    SUB AL,CL
    ADD BL,CL
    SUB BL,DL
```
**02**
![Lab 01 Task 02](https://i.ibb.co/HV1dwgf/Screenshot-20210815-155411.png "Lab 01 Task 02")
```
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
```

**03**
![Lab 01 Task 03](https://i.ibb.co/hMwJrvf/Screenshot-20210815-155542.png "Lab 01 Task 03")
```
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
```

**04**
![Lab 01 Task 04](https://i.ibb.co/j3SZhbk/Screenshot-20210815-155609.png "Lab 01 Task 04")
```
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


MAIN ENDP 
  END MAIN 
```

**05**
![Lab 02 Task 01](https://i.ibb.co/j3Trzfd/Screenshot-20210815-181215.png "Lab 02 Task 01")
```
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
```
**06**
![Lab 02 Task 02](https://i.ibb.co/pWRNG33/Screenshot-20210815-181301.png "Lab 02 Task 02")
```
.MODEL SMALL
.STACK 100H
.DATA
.CODE


MAIN PROC
    MOV AH,1
    INT 21H
    MOV BH,AL

    ADD BH ,20H

    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    MOV DL,BH
    INT 21H

    MAIN ENDP
END MAIN
```

**07**
![Lab 02 Task 03](https://i.ibb.co/HrMZwC5/Screenshot-20210815-181326.png "Lab 02 Task 03")
```
.MODEL SMALL
.STACK 100H
.DATA
A DB 'Enter First Initial: $'
B DB 'Enter Second Initial: $'
C DB 'Enter Third Initial: $'
.CODE


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

;start
    
    ;Promt
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BL,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    ;Promt
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    
    ;Promt
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;First Input
    MOV DL,BL
    INT 21H
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;Second Input
    MOV DL,BH
    INT 21H
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;Third Input
    MOV DL,CL
    INT 21H

    MAIN ENDP
END MAIN
```

**08**
![Lab 02 Task 04](https://i.ibb.co/KXcq3Wn/Screenshot-20210815-181349.png "Lab 02 Task 04")
```
.MODEL SMALL
.STACK 100H
.DATA
A DB 'ENTER A HEX DIGIT:$'
B DB 'IN DECIMAL IT IS $'
.CODE


MAIN PROC 

    MOV AX,@DATA
    MOV DS,AX
    
    ;Promp
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;Converting to Decimal
    SUB BL, 11H
    
    ;New Line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;Prompt
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;Printing Result
    MOV AH,2
    MOV DL,31H
    INT 21H
    MOV DL,BL
    INT 21H


    MAIN ENDP
END MAIN
```

**09**
![Lab 03 Task 01](https://i.ibb.co/vQ2tD4q/Screenshot-20210815-181420.png "Lab 03 Task 01")
```
.MODEL SMALL
.STACK 100H
.DATA 
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BH,AL     
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    
    CMP BH,BL         ;Compare between input 1 and 2
    JG bigOfFirst2    ;If input 1 is greater than input 2
    JL smallOfFirst2  ;If input 1 is smaller than input 2 
    
    JMP EXIT  
    
    
    bigOfFirst2:
    CMP BH,CL         ;Compare between input 1 and 3
    JL printBH        ;If input 1 is less than input 3 print input 1
    JG comp2and3      ;If input 1 is greater than input 3 compare input 2 and 3
    
    JMP EXIT  
     
      
     
    smallOfFirst2:
    CMP BH,CL          ;compare between input 1 and 3
    JG printBH         ;if input 1 is bigger than 3 print input 1
    JL comp2and3Alt    ;if input 1 is smaller than input 2 compare input 2 and 3
    
    JMP EXIT     
    
    
    ;;2nd comparison;;
    
    comp2and3:
    CMP BL,CL
    JG printBL
    JL printCL
    
    JMP EXIT
    
    comp2and3Alt:
    CMP BL,CL
    JG printCL
    JL printBL
    
    
    
    ;;;Print;;;
    
    
   printBL:
    mov ah,2
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h 
    
    MOV DL,BL
    
    MOV AH,2
    INT 21H
    JMP EXIT  
    
    
   printCL: 
    mov ah,2
    mov dl,0dh
    int 21h

    mov dl,0ah
    int 21h 
    
    MOV DL,CL
    
    MOV AH,2
    INT 21H
    JMP EXIT
       
    
   printbh: 
    mov ah,2
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h 
    
    MOV DL,BH
    
    MOV AH,2
    INT 21H
    JMP EXIT
    
    EXIT:
    
    
    
    MAIN ENDP
END MAIN
```

**10**
![Lab 03 Task 02](https://i.ibb.co/hXWYcSJ/Screenshot-20210815-181454.png "Lab 03 Task 02")
```
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
```

**11**
![Lab 03 Task 03](https://i.ibb.co/gz8nBWL/Screenshot-20210815-181519.png "Lab 03 Task 03")
```
data segment
    ; add your data here!
    input db "$"
    output db "$"
    28d db "28$"
    30d db "30$"
    31d db "31$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    lea dx, input
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    cmp al , 31h
    je output31
    
    cmp al , 32h
    je output28
    
    cmp al , 33h
    je output31
    
    cmp al ,  34h
    je output30
    
    cmp al , 35h
    je output31
    
    cmp al , 36h
    je output30
    
    
    output28:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, 28d
        mov ah, 9
        int 21h
        jmp exit
        
    output30:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, 30d
        mov ah, 9
        int 21h
        jmp exit
        
    output31:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, 31d
        mov ah, 9
        int 21h
        jmp exit
        
    exit:       
       
ends

end start
```

**12**
![Lab 03 Task 04](https://i.ibb.co/rvmtQnT/Screenshot-20210815-181551.png "Lab 03 Task 04")
```
.MODEL SMALL
.STACK 100H
.DATA

A DB '1st Side: $'
B DB '2nd Side: $'
C DB '3rd Side: $'
D DB '4th Side: $'

output db "$"
    y db "Y$"
    n db "N$" 
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    ;Taking 4 input from user

    ;Promt
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BH,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;Promt
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV BL,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;Promt
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV CH,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;Promt
    MOV AH,9
    LEA DX,D
    INT 21H
    
    ;User Input
    MOV AH,1
    INT 21H
    MOV CL,AL
          
    ;New Line                  
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    
    
    CMP BH,BL         ;Compare between input 1 and 2
    JE first2equal    ;If 1st and 2nd input equal
    JG printNO        ;Otherwise Print NO and Exit
    JL printNO
    
    JMP EXIT
    
    first2equal:
    CMP BL,CH
    JE second2equal   ;If 2nd and 3rd input equal
    JG printNO
    JL printNO
    
    second2equal:
    CMP CH,CL
    JE third2equal    ;If 3rd and 4th input equal
    JG printNO
    JL printNO
    
    third2equal:
    JE printYES       ;Print YES
    JG printNO
    JL printNO
    
    ;;;Print;;;
      
   printYES:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, y
        mov ah, 9
        int 21h
        jmp exit
        
    printNO:
        mov dl, 0AH
        mov ah , 2
        int 21h
        mov dL,0DH 
        int 21h 
        mov dL,0AH 
        int 21h 
        
        lea dx, output
        mov ah, 9
        int 21h
        
        lea dx, n
        mov ah, 9
        int 21h
        jmp exit    
    
    EXIT:
    
    
    
    MAIN ENDP
END MAIN
```
