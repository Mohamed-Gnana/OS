# For the boot loader to know this is an OS
# Some things needs to be set like MAGIC_NUMBER
# without it, the boot loader will ignore your files

.set MAGIC, 0x1badb002 # Stored in BX Register
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM


.section .text
.extern kernalMain # We want to point to our kernal function
.global loader     # The Start execution point is our loader

loader:
    mov $kernal_stack, %esp # Making IP point to kernal
    push %eax
    push %ebx
    call kernalMain

_stop:
    cli
    hlt
    jmp _stop


.section .bss
.space 2*1024*1024 # Leaving a space of 2 MB
kernal_stack:
