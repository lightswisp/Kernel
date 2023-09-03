[org 0x7c00]

KERNEL_OFFSET equ 0x1000 ; we load our kernel to the 0x1000

mov [BOOT_DRIVE], dl ; saving the bootdrive in BOOT_DRIVE, Bios stores it in dl register

mov bp, 0x9000 ; set up the stack
mov sp, bp

call cls

mov bx, WELCOME_MSG
call print ; print welcome message
 
call load_kernel ; load the kernel from the second sector -> (2..15)

mov bx, PRESS_ANY_KEY_MSG
call print

call press_any_key

call switch_to_pm ; switch to the 32bit protected mode

jmp $ ; hang


[bits 16]
; 16 bits
load_kernel:
	mov bx, KERNEL_BOOT_MSG
	call print ; print the message 

	mov bx, KERNEL_OFFSET ; everything will be loaded to the address of KERNEL_OFFSET
	mov dh, 15 						; 15 sectors
	mov dl, [BOOT_DRIVE] 
	call disk_load

	ret
	
%include "screen/cls.asm"
%include "screen/print.asm"
%include "screen/press.asm"
%include "disk/disk.asm"
%include "pm/gdt.asm"
%include "pm/switch.asm"

WELCOME_MSG db "Bootloader v0.01" , 0xA, 0xD, 0
KERNEL_BOOT_MSG db "Loading the kernel...", 0xA, 0xD, 0
PRESS_ANY_KEY_MSG db "Press ENTER key to continue..." , 0xA, 0xD, 0
BOOT_DRIVE db 0

times 510-($-$$) db 0
db 0x55, 0xaa
