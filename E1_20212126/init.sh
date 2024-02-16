nasm -f elf64 diag_asm.asm -o diag_asm.o
gcc diag_asm.o preg_diag.c -o main -lm
./main