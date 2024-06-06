printf "\x1bc\x1b[43;37mbuild....\n"
nasm -f elf32 base.asm -o base.o
pcc -c -nostdlib hello.c -o hello.o
ld -nostdlib base.o hello.o -o hello

