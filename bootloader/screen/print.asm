[bits 16]
print:
	pusha
	jmp print_loop


print_loop:
  mov ah, 0x0e
	mov al, [bx]
	cmp al, 0
	je next
  
	int 0x10 ; video services interrupt
	inc bx ; next char
	
	jmp print_loop	; jump back

next:
	popa
	ret
