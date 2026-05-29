Some useful commands for building (MAKE SURE IN CONTAINER):

Docker:     docker start -ai osdev-container
C:          gcc foo.c -o foo
Assembly:   nasm -f bin bootloader.asm -o boot.bin
Qemu:       qemu-system-x86_64 -drive format=raw,file=boot.bin -nographic -d cpu_reset
            qemu-system-x86_64 -drive format=raw,file=boot.bin -nographic -d cpu_reset,int 2>&1 | head -50