%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    xor edi, edi    ;; i
    xor eax, eax    ;; j
    xor ecx, ecx    ;; result

for_loop:

    xor eax, eax

while_loop:

    movzx ecx, byte [ebx + edi]    ;; plain[i]
    ;PRINTF32 `%c\t\x0`, ecx

    push ebx
    xor ebx, ebx
    mov bl, [edx + eax]     ;; key[j]
    ;PRINTF32 `%c\n\x0`, ebx

    sub bl, cl
    mov ecx, ebx

    pop ebx

    cmp cl, 0
    jge mind_ya_business

    add cl, 26

mind_ya_business:


    add cl, 'A'
    
    mov [esi + edi], cl    ;; enc[i] = 'A' + key[i] - plain[j] (+ 26)
    xor ecx, ecx

    add edi, 1  ;; i++
    add eax, 1  ;; j++

    cmp edi, [ebp + 8] ;; i < len_plain
    je stahp

    cmp eax, [ebp + 16] ;; j < len_key
    jne while_loop

    cmp edi, [ebp + 8]  ;; i < len_plain
    jne for_loop

stahp:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
