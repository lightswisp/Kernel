[bits 16]

press_any_key:
	pusha
	jmp press_any_key_loop

press_any_key_loop:
	mov ah, 0x00   ; Read character
	int 0x16		 	 ; Bios Keyboard service interrupt
	 
	cmp al, 0xD		 ; if Enter is pressed
	je enter			 ; jump if equal to enter

	jmp press_any_key_loop

enter:
	popa
	call cls
	ret
