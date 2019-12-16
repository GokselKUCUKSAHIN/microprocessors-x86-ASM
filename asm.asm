.data
Mybyte1 dq 1111111111111111H
Mybyte2 dq 0H
Mybyte3 dq 0H
Mybyte4 dq 0H
MyCounter db 0
i db 0h
j db 0h
sum db 0h

.code
Jelly proc 
	lea rbx, Mybyte1
	dongu:
		mov byte ptr[rbx], 22H
		inc rbx
		mov rax, Mybyte1
		add MyCounter, 1 
		cmp MyCounter, 8
		jl dongu 
	ret
Jelly endp



ABC proc 
	xor rax, rax
	xor rbx, rbx

	mov al, 5
	mov bl, 2
	dongu:
		sub al, 1
		mov cl, al
		mul bl
		mov bl, al
		mov al, cl
		cmp al, 0 
		jne dongu

	mov rax, 1111222233334444h
	mov rbx, 5555666677778888h
	mov rcx, 1111333355557777h
	mov rdx, 1234123412341234h
	mov r8,  1234567890123456h
	
	and rax, 0
	xor rbx, rbx
	sub rcx, rcx
	mov rdx, 0h

	shr r8, 32 
	shr r8, 32

	mov cx, 5
	mov ax, 2
	mov byte ptr[rdx], cl
	jlly:
		mul cl
		loop jlly
	ret
ABC endp

;GREAT , LESS denemesi
GKS proc
	mov rax, 1h
	cmp rax, 2h
	jg durumA
	jl durumB
	durumA:
		mov rbx, 1234h
	durumB:
		mov rbx, 5678h
	ret
GKS endp


;NESTED LOOPS
WhileTest proc
	lea rbx, i
	mov rcx, 0
	mov i, 1
	while02:
		cmp i, 2
		jg endwhile02
		mov j, 1
		while03:
			cmp j, 3
			jg endwhile03
			inc j
			inc rcx
			jmp while03
		endwhile03:
			nop
			inc i
			jmp while02
	endwhile02:
		nop
	ret
WhileTest endp

;ALISTIRMA ÇALIÞMASI 1

doWhile proc
	lea rbx, i
	mov i, 10
	mov al, 0
	DO:
		add al,[i]
		sub i, 2
		cmp i, 0
		jg DO
	ret
doWhile endp


; DO WHILE 2

doWhile2 proc
	lea rbx, i ; For Variable Address
	mov i, 1h
	DO:
		inc i
		cmp i, 3
		jle DO
	ret
doWhile2 endp
end