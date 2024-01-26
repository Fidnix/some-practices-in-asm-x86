nasm -f elf64 main.asm -o out.o
ld out.o -o out
./out
