name "JellyBeanci"

org 100h

jmp starDraw     

star: db "*$"
nl: db 0Dh,0Ah,"$"       
count db 0h, 0h 

starDraw:   
    mov byte ptr [count], 0h
    d1:
        mov byte ptr [count+1], 0h
        d2:
            mov dx, star
            mov ah, 9
            int 21h
            inc byte ptr [count+1]
            xor ax, ax
            mov al, byte ptr [count+1]
            sub al, byte ptr [count]
            cmp al, 0
            jle d2
            mov dx, nl
            mov ah, 9
            int 21h
        inc byte ptr [count]
        cmp byte ptr [count], 10
        jne d1   
    mov ah, 0
    int 16h     
ret
