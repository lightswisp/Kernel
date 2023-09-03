#!/usr/bin/bash

nasm kernel_entry.asm -felf64 -o build/kernel_entry.o 		 																# build kernel entrypoint


gcc -ffreestanding -c kernel/kernel.c -o build/kernel.o  																# build C kernel

ld -o build/kernel.bin -Ttext 0x1000 build/kernel_entry.o build/kernel.o --oformat binary # link kernel entrypoint and kernel together

cd bootloader

nasm main.asm -o ../build/bootloader.bin    		 																# build bootloader

cd ../

cat build/bootloader.bin build/kernel.bin > build/os # put all together

