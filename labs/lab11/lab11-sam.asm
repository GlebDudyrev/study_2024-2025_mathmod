%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0h                    ; Имя файла
msg db 'Как Вас зовут? ', 0h 	; Сообщения
msg2 db 'Меня зовут ', 0h

SECTION .bss
contents resb 255        ; переменная для вводимой строки

SECTION .text
global _start
_start:

; --- Печать сообщения `msg`
mov eax,msg
call sprint

; ---- Запись введеной с клавиатуры строки в `contents`
mov ecx, contents
mov edx, 255
call sread

; --- Создание файла (`sys_creat`)
mov ecx, 0777o ; права доступа
mov ebx, filename ; имя файла
mov eax, 8
int 80h

; --- Запись дескриптора файла в `esi`
mov esi, eax

; --- Расчет длины msg2
mov eax, msg2     ; в `eax` запишется количество
call slen         ; введенных байтов

; --- Записываем в файл "Меня зовут " (`sys_write`)
mov edx, eax
mov ecx, msg2
mov ebx, esi
mov eax, 4
int 80h

; --- Расчет длины введенной строки
mov eax, contents ; в `eax` запишется количество
call slen         ; введенных байтов

; --- Записываем в файл `contents` (`sys_write`)
mov edx, eax
mov ecx, contents
mov ebx, esi
mov eax, 4
int 80h

; --- Закрываем файл (`sys_close`)
mov ebx, esi
mov eax, 6
int 80h

call quit
