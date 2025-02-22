%include 'in_out.asm'

SECTION .data
variant: DB 'Вариант 4. Выражение: 4/3(x-1)+5.',0
vvod: DB 'Введите x: ',0
rez: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, variant
call sprintLF

mov eax, vvod
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov eax, x
call atoi

dec eax  ; x-1

mov ebx, 4 ; (x-1)*4
mul ebx

xor edx,edx ;(x-1)*4/3
mov ebx, 3
div ebx

add eax, 5 ;(x-1)*4/3+5

mov edi,eax

mov eax, rez
call sprint
mov eax, edi
call iprintLF

call quit