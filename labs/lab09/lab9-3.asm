%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0

SECTION .text
global _start
_start:
pop ecx    ; Извлекаем из стека в `ecx` количество
           ; аргументов (первое значение в стеке)
pop edx    ; Извлекаем из стека в `edx` имя программы
           ; (второе значение в стеке)
sub ecx,1  ; Уменьшаем `ecx` на 1 (количество
           ; аргументов без названия программы)
mov esi,1  ; Используем `esi` для хранения промежуточных произв.

next:
cmp ecx,0h
jz _end

pop eax
call atoi
mov ebx,eax
mov eax,esi
mul ebx  ; eax=eax*ebx
mov esi,eax
loop next

_end:
mov eax,msg
call sprint
mov eax,esi
call iprintLF
call quit