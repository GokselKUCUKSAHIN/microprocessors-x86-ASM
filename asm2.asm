.code
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

end