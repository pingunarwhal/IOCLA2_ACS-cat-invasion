%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;; initializing registers with 0
    xor ecx, ecx
    xor eax, eax

    ;; loop that iterates through plain text string
loop:
    mov ah, byte [esi + ecx]

    ;; shifting each letter with the step
    add ah, byte [ebp + 20]
    cmp ah, byte 90
    jle back
    ;; subtracting the nujmber of letters in the alphabet if the value 
    ;; is greater than the ascii code of Z
    sub ah, byte 26
    
back:
    ;; copying the result in the encryped string
    mov byte [edi + ecx], ah
    add ecx, 1
    cmp ecx, [ebp + 8]
    jne loop

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
