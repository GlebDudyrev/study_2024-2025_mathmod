%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
fn db "Вариант 4. Функция: f(x)=2(x-1)."
SECTION .text
global _start
_start:
pop ecx    ; Извлекаем из стека в `ecx` количество
           ; аргументов (первое значение в стеке)
pop edx    ; Извлекаем из стека в `edx` имя программы
           ; (второе значение в стеке)
sub ecx,1  ; Уменьшаем `ecx` на 1 (количество
           ; аргументов без названия программы
mov esi,0  ; Используем `esi` для хранения промежуточных результатов

next:
cmp ecx,0h
jz _end

pop eax ; eax=x
call atoi
sub eax,1 ; eax=x-1
mov ebx,2
mul ebx  ; eax=(x-1)*2
add esi,eax ; esi=esi+eax
loop next

_end:
mov eax,fn
call sprintLF
mov eax,msg
call sprint
mov eax,esi
call iprintLF
call quit
