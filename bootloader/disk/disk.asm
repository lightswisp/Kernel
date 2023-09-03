disk_load:
	pusha
	mov ah , 0x02 ; BIOS read sector function
	mov al , dh ; Read DH sectors
	mov ch , 0x00 ; Select cylinder 0
	mov dh , 0x00 ; Select head 0
	mov cl , 0x02 ; Start reading from second sector ( i.e.
	; after the boot sector )
	int 0x13 ; BIOS interrupt
	popa
	ret
