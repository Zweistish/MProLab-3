.model small
.stack 100h

.data

prompt1 db 'Enter Num1 (0-9): $'
prompt2 db 13,10,'Enter Num2 (0-9): $'

msgGreater db 13,10,'Num1 is greater than Num2$'
msgLesser  db 13,10,'Num1 is less than Num2$'
msgEqual   db 13,10,'Num1 and Num2 are equal$'
msgInvalid db 13,10,'Invalid Input$'

.code

main proc

    mov ax,@data
    mov ds,ax

    ; INPUT NUM1
    lea dx,prompt1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h

    cmp al,'0'
    jb INVALID

    cmp al,'9'
    ja INVALID

    mov bl,al

    ; INPUT NUM2
    lea dx,prompt2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h

    cmp al,'0'
    jb INVALID

    cmp al,'9'
    ja INVALID

    mov bh,al

    ; COMPARE NUMBERS
    cmp bl,bh

    ja NUM1_GREATER
    jb NUM1_LESSER

    ; EQUAL
    lea dx,msgEqual
    mov ah,09h
    int 21h
    jmp EXIT

NUM1_GREATER:
    lea dx,msgGreater
    mov ah,09h
    int 21h
    jmp EXIT

NUM1_LESSER:
    lea dx,msgLesser
    mov ah,09h
    int 21h
    jmp EXIT

INVALID:
    lea dx,msgInvalid
    mov ah,09h
    int 21h

EXIT:
    mov ah,4Ch
    int 21h

main endp
end main