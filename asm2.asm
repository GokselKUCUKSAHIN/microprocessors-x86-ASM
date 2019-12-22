.data
MyByte db 10, 11, 12, 13
MyByte2 dq 12h, 34h
MyByte3 dd 38h, 20h
MyByte5 dw 1234h, 5678h
MyByte4 db 12
FucksGiven db 0
notlar db 69h, 87h, 96h, 45h, 75h
enyuksek db ?

.code

TestFunction proc
	lea rbx, MyByte
	push 0h
	push 0h
		;add [MyByte], 76
		;mov rax, qword ptr[MyByte3]
	push word ptr [MyByte5]
	mov rax, 123h
	push ax
	pop rbx
	lea rdx, enyuksek
TestFunction endp

Hello proc
	mov cx,5
	mov ah, 0eh
	mov al, '*'
	int 10h
	;mov rax , 100h
	ret
Hello endp

TheBiggest proc
	mov rax, rcx
	push rdx
	push r8
	push r9
	mov cx, 3
	dongu:
		pop rbx
		cmp rax, rbx
		jge donothing
		exchange:
			xchg rax, rbx
		donothing: 
			nop
		loop dongu
	ret
TheBiggest endp

Max proc
	cmp rcx, rdx
	jge cDonder
	mov rax, rdx
	jmp endDonder
	cDonder:
		mov rax,rcx
	endDonder:
		nop
	ret
Max endp 
end