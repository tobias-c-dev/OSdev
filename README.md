Some useful commands for building (MAKE SURE IN CONTAINER):

Docker:     docker start -ai osdev-container
C:          gcc foo.c -o foo
Assembly:   nasm -f bin bootloader.asm -o boot.bin
Qemu:       qemu-system-x86_64 -drive format=raw,file=boot.bin
            qemu-system-x86_64 -drive format=raw,file=boot.bin -monitor stdio -nographic    (for output in terminal)
            qemu-system-x86_64 -drive format=raw,file=boot.bin -s -S                        (for setting up GDB)
            gdb
            (gdb) target remote :1234           # port
            (gdb) set architecture i8086        # 16-bit Real mode                          (setup for GDB to connect stored in debug.gdb)
            (gdb) break *0x7c00                 # breakpoint at this address
            (gdb) si                            # step thorugh one instruction at a time
            (gdb) continue                      # continue on until next breakpoint
            can alternately run debug script with gdb -x debug.gdb which will take you straight to breakpoint
