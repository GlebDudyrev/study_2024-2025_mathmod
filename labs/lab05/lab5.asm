; hello.asm
SECTION .data
	fio: DB 'Галацан Николай',10

	fioLen: EQU $-fio

SECTION .text
	GLOBAL _start
	
_start:
	mov eax,4 
	mov ebx,1
	mov ecx,fio
	mov edx,fioLen
	int 80h
	mov eax,1
	mov ebx,0
	int 80h
