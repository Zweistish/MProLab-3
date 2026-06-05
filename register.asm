.model small
.stack 100h

.data
titleMsg    db 'Member Registration Form',13,10,13,10,'$'

msg1        db 'ENTER YOUR NAME -> $'
msg2        db 'ENTER YOUR AGE -> $'
msg3        db 'ENTER YOUR ADDRESS -> $'
msg4        db 'ENTER YOUR CIVIL STATUS -> $'
msg5        db 'ENTER YOUR RELIGION -> $'
msg6        db 'ENTER YOUR CITIZENSHIP -> $'
msg7        db 'ENTER YOUR SCHOOL -> $'
msg8        db 'ENTER YOUR COURSE -> $'
msg9        db 'ENTER YOUR YEAR -> $'
msg10       db 'ENTER YOUR ID NUMBER -> $'
msg11       db 'ENTER YOUR CONTACT NUMBER -> $'
msg12       db 'ENTER YOUR EMAIL -> $'

newline     db 13,10,'$'

header1     db 13,10,'----------Personal Information----------',13,10,'$'
header2     db 13,10,'----------Education----------',13,10,'$'
header3     db 13,10,'----------Contact Information----------',13,10,'$'

lblName     db 'Name: $'
lblAge      db 'Age: $'
lblAddress  db 'Address: $'
lblCivil    db 'Civil Status: $'
lblReligion db 'Religion: $'
lblCitizen  db 'Citizenship: $'
lblSchool   db 'School: $'
lblCourse   db 'Course: $'
lblYear     db 'Year: $'
lblID       db 'ID Number: $'
lblContact  db 'Contact Number: $'
lblEmail    db 'Email: $'

nameBuf     db 50,0,50 dup('$')
ageBuf      db 20,0,20 dup('$')
addressBuf  db 80,0,80 dup('$')
civilBuf    db 30,0,30 dup('$')
religBuf    db 30,0,30 dup('$')
citizenBuf  db 30,0,30 dup('$')
schoolBuf   db 50,0,50 dup('$')
courseBuf   db 30,0,30 dup('$')
yearBuf     db 10,0,10 dup('$')
idBuf       db 30,0,30 dup('$')
contactBuf  db 30,0,30 dup('$')
emailBuf    db 50,0,50 dup('$')

.code
main proc
    mov ax,@data
    mov ds,ax

    lea dx,titleMsg
    call PrintString

    lea dx,msg1
    call PrintString
    lea dx,nameBuf
    call ReadInput

    lea dx,msg2
    call PrintString
    lea dx,ageBuf
    call ReadInput

    lea dx,msg3
    call PrintString
    lea dx,addressBuf
    call ReadInput

    lea dx,msg4
    call PrintString
    lea dx,civilBuf
    call ReadInput

    lea dx,msg5
    call PrintString
    lea dx,religBuf
    call ReadInput

    lea dx,msg6
    call PrintString
    lea dx,citizenBuf
    call ReadInput

    lea dx,msg7
    call PrintString
    lea dx,schoolBuf
    call ReadInput

    lea dx,msg8
    call PrintString
    lea dx,courseBuf
    call ReadInput

    lea dx,msg9
    call PrintString
    lea dx,yearBuf
    call ReadInput

    lea dx,msg10
    call PrintString
    lea dx,idBuf
    call ReadInput

    lea dx,msg11
    call PrintString
    lea dx,contactBuf
    call ReadInput

    lea dx,msg12
    call PrintString
    lea dx,emailBuf
    call ReadInput

    lea dx,header1
    call PrintString

    lea dx,lblName
    call PrintString
    lea dx,nameBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblAge
    call PrintString
    lea dx,ageBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblAddress
    call PrintString
    lea dx,addressBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblCivil
    call PrintString
    lea dx,civilBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblReligion
    call PrintString
    lea dx,religBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblCitizen
    call PrintString
    lea dx,citizenBuf+2
    call PrintString
    call PrintNewLine

    lea dx,header2
    call PrintString

    lea dx,lblSchool
    call PrintString
    lea dx,schoolBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblCourse
    call PrintString
    lea dx,courseBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblYear
    call PrintString
    lea dx,yearBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblID
    call PrintString
    lea dx,idBuf+2
    call PrintString
    call PrintNewLine

    lea dx,header3
    call PrintString

    lea dx,lblContact
    call PrintString
    lea dx,contactBuf+2
    call PrintString
    call PrintNewLine

    lea dx,lblEmail
    call PrintString
    lea dx,emailBuf+2
    call PrintString
    call PrintNewLine

    mov ah,4Ch
    int 21h
main endp

PrintString proc
    mov ah,09h
    int 21h
    ret
PrintString endp

PrintNewLine proc
    lea dx,newline
    call PrintString
    ret
PrintNewLine endp

ReadInput proc
    mov ah,0Ah
    int 21h

    push bx
    push si

    mov bx,dx
    mov si,bx
    mov al,[si+1]
    xor ah,ah
    add si,ax
    add si,2
    mov byte ptr [si],'$'

    call PrintNewLine

    pop si
    pop bx
    ret
ReadInput endp

end main
