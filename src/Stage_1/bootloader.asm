; This contains the assembly for a 16 bit bootloader operating solely in Real mode

[BITS 16]                   ; must be in 16 bit Real mode
[ORG 0x7C00]                ; loads into address 0x7C00 expected for bootloader

start:
    mov SI, msg             ; moves the address of msg into the source index register used for strings and arrays
    call print              ; calls the print function and pushes the return address to stack
    jmp hang                ; infinite loop by jumping to current address to prevent CPU read/writing random data

print:
    lodsb                   ; loads byte from [si] directly into AL (hardcoded for these registers) and indexes one place forward through msg
    or AL, AL               ; checks if al is = 0
    jz print_done                ; if zero flag satisfied by reaching null terminator in msg then jump to .done (. means local function to print)
    mov AH, 0x0E            ; moves the teletype output address to ah
    int 0x10                ; video interrupt sees AX register and since al contains the character and ah contains teletype it prints the character
    jmp print               ; loops back to print and loads next byte since lodsb already incremented

hang:
    cli
    hlt
    jmp hang

print_done:
    ret                     ; pops the return address off the stack so it jumps back to instruction after the function that called it (print)

msg db "Boobies ", 0        ; dumps given bytes into RAM as an array msg

times 510-($-$$) db 0       ; dumps zeros into the binary up to 510 calculated from $=current byte $$=start of section
dw 0xAA55                   ; writes two magic bytes at bytes 511-512 as is required by the BIOS for the boot sectors