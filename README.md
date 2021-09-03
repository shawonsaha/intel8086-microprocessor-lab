**01**

Swap two numbers using ADD/SUB instructions only.

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/2KsZdm4/image.png" alt="Swap two numbers using ADD/SUB instructions only" title="Swap two numbers using ADD/SUB instructions only">
</details>

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
---
**02**

If P, Q and R are 3 variables, perform the given mathematical operation

• Q = (P + R) - Q

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/5jnZV92/image.png" alt="mathematical operation Q=(P+R)-Q" title="Smathematical operation Q=(P+R)-Q">
</details>

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
---

**03**

If A, B and C are 3 variables, then perform the given mathematical operation

• A / B * C

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/k431GWS/image.png" alt="" title="mathematical operation A/B*C">
</details>

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
---
**04**

Perform the following arithmetic operation: (1 + 2) / (3 - 1) * 5 - 3 + 2 - (1 / 2)

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/sJcMNV1/image.png" alt="arithmetic operation: (1 + 2) / (3-1) *5-3+2-(1/2)" title="arithmetic operation: (1 + 2) / (3-1) *5-3+2-(1/2)">
</details>

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
---

**05**

Take two numbers as input, multiply them, print the message “The result is” and then display the result in the next line.

Sample Execution:  <br />
1 (1st input)  <br />
2 (2nd input)  <br />

The result is <br />
1

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/wdpryL8/image.png" alt="Take two numbers as input, multiply them" title="Take two numbers as input, multiply them">
</details>

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
---

**06**

Take an uppercase letter as input from the user (omit error checking, so you do not have to write code for checking whether the user is inputting upper case or lower case), and display it at the next position on the next line in lower case.

Sample Execution 1: <br />
A <br />
a 

Sample Execution 2: <br />
B <br />
b

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/g6nyTFD/image.png" alt="convert uppercase letters to lowercase" title="convert uppercase letters to lowercase">
</details>

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
---

**07**

Write a program to: (a) prompt the user, (b) read first initial, then the middle, and then the last initial of a person's name, and then {c) display them down the left margin.

Sample execution: <br />
Enter First Initial: S <br />
Enter Second Initial: F <br />
Enter Third Initial: L

S <br />
F <br />
L

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/chxpRhL/image.png" alt="First, middle and last initial" title="First, middle and last initial">
</details>

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
---

**08**

Write a program to read one of the hex digits A-F, and display it on the next line in decimal.

Sample execution: <br />
ENTER A HEX DIGIT: C <br />
IN DECIMAL IT IS 12

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/mh7FgXk/image.png" alt="Hex to Decimal" title="Hex to Decimal">
</details>

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
---

**09**

Write a program which takes in 3 digits as input from the user and finds the number which is not maximum or minimum.

Sample input: <br />
1st input: 7 <br />
2nd input: 10 <br />
3rd input: 9

Sample Output:
9

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/qFgQsfW/image.png" alt="find not maximum nor minimum" title="find not maximum nor minimum">
</details>

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
---

**10**

Take two digits as input from the user and multiply them. If the result is divisible by 4 and 6 both, print “Divisible”. Otherwise print “Not divisible”

Sample input: <br />
1st input: 8 <br />
2nd input: 3

Result is 24

Sample Output:
Divisible

Sample input: <br />
1st input: 4 <br />
2nd input: 5

Result is 20

Sample Output:
Not divisible

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/sJ9JQjJ/image.png" alt="divisible by n1 and n2 checker" title="divisible by n1 and n2 checker">
</details>

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
---

**11**

Write a program which takes in a digit from 1 to 6 where each digit represents a month in a calendar year. For example the digit 1 represents January, 2 represents February, and 3 represents March and so on, Your program should then output the total number of days in that month

Sample input: 4 [which represents April]

Sample Output: 30

Sample input: 2 [which represents February]

Sample Output: 28

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/hXvFhqH/image.png" alt="days in a month" title="days in a month">
</details>

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
---

**12**

Write a program that takes as input the length of 4 sides of a square and check whether a valid square can be formed or not. If the sides form a square, print “Y”, otherwise print “N”.

Sample input: <br />
1st side: 4 <br />
2nd side: 2 <br />
3rd side: 4 <br />
4th side: 2

Sample Output: N

Sample input: <br />
1st side: 6 <br />
2nd side: 6 <br />
3rd side: 6 <br />
4th side: 6

Sample Output: Y

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/PDycGSS/image.png" alt="Square Validator" title="Square Validator">
</details>

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
---

**13**

Write a  program which takes in two numbers and finds all the numbers that are divisible by 5 within that range

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/cNx8xqB/image.png" alt="numbers divisible by 5 within a range" title="numbers divisible by 5 within a range">
</details>

```
.MODEL SMALL
.STACK 100H

.DATA 
PROMPT1 DB 'Enter First Number: $'
PROMPT2 DB 'Enter Second Number: $'
MSG DB 'numbers that are divisible by 5 within that range is: $'

.CODE
MAIN PROC  
   MOV AX,@DATA
   MOV DS,AX
   
   ;BEGIN
   
   ;DISPLAY PROMPT1
   LEA DX, PROMPT1
   MOV AH, 9
   INT 21H
       
   MOV AH,1
   INT 21H
   MOV BL,AL
   SUB BL,30H
   
   ;New Line
   MOV AH,2
   MOV DL,0DH
   INT 21H
   MOV DL,0AH
   INT 21H
   
   ;DISPLAY PROMPT2
   LEA DX, PROMPT2
   MOV AH, 9
   INT 21H
   
   MOV AH,1
   INT 21H
   SUB AL,30H
   MOV CL,AL    
   
   ;User Input
   MOV AH,2
   MOV DL,0DH
   int 21H

   MOV DL,0AH
   INT 21H
   
   ;Prompt
   MOV AH,9
   LEA DX,MSG
   INT 21H 
   
   JMP BEGIN    
   
   BEGIN: 
   CMP BL,CL
   JG EXIT
   
   MOV AX,BX 
   MOV DL,5H
   
   
   DIV DL
   
   CMP AH,00
   JE OUTPUT
   
   INC BL 
   JMP BEGIN
       
   OUTPUT: 
   MOV DL,BL
   ADD DL,30H
   MOV AH,2
   
   INT 21H  
   
   INC BL
   JMP BEGIN
   
   
   EXIT:
   MOV AX,4C00H
   INT 21H                         
   MAIN ENDP
      END MAIN
```
---

**14**

Find the sum of the following sequence using loops print the result

a. 1 − 2 + 4 − 8 + 16 − ...... + 512

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/1mkb09t/image.png" alt="sum of number sequence using loops" title="sum of number sequence using loops">
</details>

```
.MODEL SMALL
.STACK 100H

.DATA
STRING DB 5 DUP(?)
DASH DB '-$'
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

MOV AX, 1
XOR DX, DX    ;THIS PUTS ZERO IN DX
XOR CX,CX     ;THIS PUTS ZERO IN CX
ADD DX, AX
ADD DX, AX
MOV BX,DX

ADD CX,AX
MUL BX
SUB CX,AX
MUL BX
ADD CX,AX
MUL BX
SUB CX,AX
MUL BX
ADD CX,AX
MUL BX
SUB CX,AX
MUL BX
ADD CX,AX
MUL BX
SUB CX,AX
MUL BX
ADD CX,AX
MUL BX
SUB CX,AX            ;GOT THE FINAL RESULT

XOR BX,BX            ;RESET BX TO 0
MOV BX, 65535        ;STORE HEX VALUE FFFF TO BX
SUB BX,CX            ;SUB FFFF TO FINAL RESULT TO GET THE POSITIVE VALUE OF THE NEGATIVE INTEGER
ADD BX, 1            ;FIXING 0 INDEX BY ADDING 1
XOR AX,AX            ;RESET AX TO 0
MOV AX,BX            ;STORING BX INTO AX FOR PRINTING PURPOSE

;CONVERTING 16BIT HEX DIGIT INTO DECIMAL AND PRINTING TO SCREEN

PUSH BX              ; RESERVING BX AND CX FOR LATER USE BY PUSHIN STACK
PUSH CX
LEA SI, STRING
	
MOV BX, 10			 ;STORING 2 DIGITS NUMBER AS CHARACTER IN STRING
XOR CX, CX
DIVISION: XOR DX,DX
DIV BX
PUSH DX
INC CX
CMP AX, 0
JNE DIVISION
STORE: POP DX
ADD DL, 48
MOV [SI], DL
INC SI
LOOP STORE
MOV [SI], '$ '

POP CX
POP BX

LEA DX, DASH
MOV AH, 9
INT 21H
    
LEA DX, STRING       ;GET THAT 2 DIGIT NUMBER WHICH IS CHARACTER FROM STRING
MOV AH, 9
INT 21H


MAIN ENDP
END MAIN
```
---

**15**

Write a program which stores a number in AX, stores another number in BX and multiplies them  using repeated summation and prints the result. You will not be able to use the “MUL” function here. And you do not have to take overflow into account

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/3NTkd8y/image.png" alt="Multiply using repeated summation" title="Multiply using repeated summation">
</details>

```
.MODEL SMALL
.STACK 100H
.DATA
STRING DB 5 DUP(?)
MSG DB 'AX * BX = $'  
.CODE


MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    ;NUMBER YOU WANT TO MULTIPLY 
    
    MOV AX, 15       ;STORE NUMBER IN AX
    
    ;HOW MANY REPEATIONS YOU WANT
    
    MOV BX, 10       ;STORE NUMBER IN BX
                                 
    
    MOV CX,BX
    MOV BX,AX                             
    SUB CX, 1       ;SUBTRACTION (N-1) BECAUSE AX * BX == AX * BX+1
    

    L1:
      ADD AX,BX
      LOOP L1

    ;CONVERTING 16 BIT HEX VALUE TO DECIMAL AND PRINT
    
    PUSH BX                 ;; RESERVING BX AND CX FOR LATER USE BY PUSHIN STACK
    PUSH CX
    LEA SI, STRING
    
    MOV BX, 10              ;; STORING 2 DIGITS NUMBER AS CHARACTER IN STRING
    XOR CX, CX
    DIVISION: XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE DIVISION
    STORE: POP DX
    ADD DL, 48
    MOV [SI], DL
    INC SI
    LOOP STORE
    MOV [SI], '$ '
    
    POP CX
    POP BX
    
    LEA DX, MSG
    MOV AH, 9
    INT 21H
    
    LEA DX, STRING         ;;GET THAT 2 DIGIT NUMBER WHICH IS CHARACTER FROM STRING
    MOV AH, 9
    INT 21H

    MAIN ENDP
END MAIN
```
---

**16**

Write a program that will prompt the user to enter a hex digit character ("0" ... "9" or "A" ... "F'), display it on the next line in decimal, and ask the user if he or she wants to do it again. If the user types “y" or "Y", the program repeats. If the user types “n” or “N” the program terminates. If the user enters an illegal character, prompt the user to try again

ENTER A HEX DIGIT: 9 <br />
IN DECIMAL IT IS 9

DO YOU WANT TO DO IT AGAIN?: y <br />
ENTER A HEX DIGIT: c <br />
ILLEGAL CHARACTER, INSERT AGAIN: C <br />
IN DECIMAL IT IS 12

DO YOU WANT TO DO IT AGAIN? : N

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/vw823xW/image.png" alt="Verify Hex and convert to Decimal" title="Verify Hex and convert to Decimal">
</details>

```
.MODEL SMALL
.STACK 100H
.DATA
TEXT1 DB 10,13,'ENTER A HEX DIGIT: $'
TEXT2 DB 10,13,'IN DECIMAL IT IS $'
TEXT3 DB 10,13,'DO YOU WANT TO DO IT AGAIN? : $'
TEXT4 DB 10,13,'ILLEGAL CHARACTER, INSERT AGAIN: $'


.CODE   


RETRY:

    MOV AX,@DATA
    MOV DS,AX
    LEA DX,TEXT1
    MOV AH,9
    INT 21H
   
    MOV AH,1
    INT 21H
   
    MOV BL,AL 
   
    JMP PROCEED
   
   
PROCEED:   

    CMP BL,'9'
    JA ATOF
    JB ZEROTONINE
    JE ZEROTONINE
           
       
ATOF:

    CMP BL,'F'
    JA NOTAHEX  
    
    
    LEA DX,TEXT2 
    MOV AH,9
    INT 21H
   
    MOV DL,49D
    MOV AH,2
    INT 21H
    
    SUB BL,17D
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    JMP USERINPUT
       
    
USERINPUT:
    
    LEA DX,TEXT3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV CL,AL
    CMP CL,'y'
    JE RETRY
    CMP CL,'Y'
    JE RETRY
    JMP EXIT
    
   
ZEROTONINE:
   
    CMP BL,'0'
    JB NOTAHEX
   
    LEA DX,TEXT2 
    MOV AH,9
    INT 21H 
       
    MOV DL,BL
    MOV AH,2
    INT 21H
   
    JMP USERINPUT
   
      
NOTAHEX:

    LEA DX,TEXT4
    MOV AH,9
    INT 21H
       
    MOV AH,1
    INT 21H
       
    MOV BL,AL 
    JMP PROCEED
       
       
EXIT:
```
---

**17**

Take your name as input in an array. Then your program will have to capitalize all the small letters and convert all the small letters into capital letters.

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/6vf5Rpj/image.png" alt="Reverse all capital letters to small and vice versa" title="Reverse all capital letters to small and vice versa">
</details>

```
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
```
---

**18**

Take three inputs from the user and find the maximum of the three numbers

Sample Input:

Enter Three numbers: 1 2 3 

Largest Number: 3

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/wY9WRQm/image.png" alt="find maximum of three inputs" title="find maximum of three inputs">
</details>

```
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
```
---

**19**

Take an array of size 5, then populate the array. Your program will then sort the array in ascending order

<details>
  <summary>Show Original</summary>
  <img src="https://i.ibb.co/44f5Qqh/image.png" alt="sort 5 input in ascending order from an array" title="sort 5 input in ascending order from an array">
</details>

```
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
```
---
