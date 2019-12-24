.data
MyByte db 10, 11, 12, 13
MyByte2 dq 12h, 34h
MyByte3 dd 38h, 20h
MyByte5 dw 1234h, 5678h
MyByte4 dd 12
FucksGiven db 0h
notlar db 69h, 87h, 96h, 45h, 75h
enyuksek db ?

.code
Divide proc
	mov eax, ecx
	mov r8d, edx
	xor rdx, rdx
	idiv r8d
	ret
Divide endp

Remainder proc
	mov eax, ecx
	mov r8d, edx
	and rdx, 0
	idiv r8d
	mov eax, edx
	ret
Remainder endp

Soru proc
	mov r8, 25
	lea rbx, [r8 + r8*2]
	shl rbx, 3
	shl r8, 5
	add r8, rbx
	mov rax, r8
	;mov rcx, 256
	mov rax, 30
	;sub cl, al
	mov rax, 0d2h
Soru endp

Fibonacci proc
	mov rax, 0
	mov rbx, 1
	mov rcx, 9
	dongu:
		push ax
		add rax, rbx
		xchg rax, rbx
		loop dongu
Fibonacci endp


Multi proc
	mov rax, 13
	mov byte ptr [MyByte], 03H 
	lea rdx, [rax*2]
Multi endp


JumpTest proc
	lea rbx, MyByte4
	mov rax, 0
	mov rcx, 10
	dongu:
		mov dl, byte ptr [rbx + rax]
		inc rax
		loop dongu
	mov rax, [rbx + 3]

	mov dword ptr [MyByte4], 99999999h
	
	mov MyByte4, 1234h
	;mov word ptr[MyByte4], 1234h
	cmp rax, rbx
	jg Label1
	jmp EndLabel

Label1:
	mov rdx, 1
	jmp EndLabel

Label2:
	mov rdx, 2
	jmp EndLabel
	
EndLabel:
	nop
	ret
JumpTest endp


SixtyNine proc
	lea rbx, [rcx + rcx * 4]
	shl rcx, 6
	mov rax, rcx
	add rax, rbx
	ret
SixtyNine endp 


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


FillStack proc
	mov rcx, 20
	mov ax, 1111h
	dongu:
		push ax
		inc ax
		loop dongu
FillStack endp

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
		xchg rax, rbx
			donothing: 
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

DegerAl proc
	mov eax, ecx
	cmp edx, eax
	jg ReturnEAX
	mov eax, edx
ReturnEAX:
	ret
DegerAl endp
end