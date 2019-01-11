#CC=/home/conghao/x86_64-elf-4.9.1-Linux-x86_64/bin/x86_64-elf-gcc
#AS=/home/conghao/x86_64-elf-4.9.1-Linux-x86_64/bin/x86_64-elf-as
COMPILERPREFIX = /home/conghao/opt/cross/bin/i686-elf-
#COMPILERPREFIX = /home/conghao/i686-elf-4.9.1-Linux-x86_64/bin/i686-elf-
CC = $(COMPILERPREFIX)gcc
AS = $(COMPILERPREFIX)as

os00.bin:boot.o #kernel.o
	$(CC) -T linker.ld -o os00.bin -ffreestanding -O2 -nostdlib boot.o -lgcc

boot.o:boot.s
	$(AS) boot.s -o boot.o

kernel.o:kernel.c
	$(CC) -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

clean:
	-rm -f *.o *.out
