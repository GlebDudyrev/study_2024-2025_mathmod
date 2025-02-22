%include 'in_out.asm'
section .data
var  db 'Вариант 4.',0h
msgx db 'Введите x: ',0h
msga db 'Введите a: ',0h
res db 'Результат: ',0h 

section .bss
x resb 10
a resb 10
r resb 10

section .text
global _start
_start:
mov eax,var
call sprintLF

mov eax,msgx
call sprint

mov ecx,x
mov edx,10
call sread

mov eax, x
call atoi
mov [x],eax

mov eax,msga
call sprint

mov ecx,a
mov edx,10
call sread

mov eax, a
call atoi
mov [a],eax

mov edx,0
cmp edx,[a]
je label1
mov eax,[x]
mov ebx,2
mul ebx
add eax, [a]
mov [r],eax
jmp fin

label1:
mov eax,[x]
mov ebx,2
mul ebx ; 2*x
inc eax ; 2*x+1
mov [r],eax

fin:
mov eax, res
call sprint
mov eax,[r]
call iprintLF
call quit
