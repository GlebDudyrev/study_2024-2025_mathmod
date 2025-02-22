%include 'in_out.asm'
section .data
res db 'Наибольшее число:  ',0h
A dd '8'
B dd '88'
C dd '68'

section .bss
max resb 10

section .text
global _start
_start:

mov ecx,[A] ;запись А в max
mov [max],ecx

cmp ecx,[B] ;сравнение А и В
jg check_C ;если А>B
mov ecx,[B] ;иначе
mov [max],ecx

check_C:
cmp ecx,[C] ;сравнение большего из А и В с С
jg fin ;если max>С
mov ecx,[C]
mov [max],ecx

fin:
mov eax, res
call sprint

mov eax,max
call atoi ;преобразование символа в число
mov [max],eax

mov eax,[max]
call iprintLF
call quit
