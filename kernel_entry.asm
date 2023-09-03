[bits 32]
[extern main]

call main ; invoke main() inside the C kernel
jmp $			; hang after main() returns
