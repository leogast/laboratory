CC=nios2-elf-as
CFLAGS=--gstabs

LD=nios2-elf-ld

lab2-1: lab2.s
	$(CC) $(CFLAGS) -o lab2.o lab2.s
	$(LD) -o lab2.elf lab2.o
	nios2-download lab2.elf -c 1 -g

lab2: lab2.s
	$(CC) $(CFLAGS) -o lab2.o lab2.s
	$(LD) -o lab2.elf lab2.o
	nios2-download lab2.elf -c 1 -g
	nios2-download lab2.elf -c 2 -g
