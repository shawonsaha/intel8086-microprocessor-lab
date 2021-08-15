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