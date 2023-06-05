CC=nios2-elf-as
CFLAGS=--gstabs

LD=nios2-elf-ld

lab1: lab1.s
	$(CC) $(CFLAGS) -o lab1.o lab1.s
	$(LD) -o lab1.elf lab1.o
	nios2-download lab1.elf -c 1 -g

clean:
	rm lab1.elf lab1.o
