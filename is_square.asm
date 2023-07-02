%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    xor edx, edx    ;; distance iterator

loop:
    xor edi, edi

square_loop:
    mov eax, edi
    imul eax, eax
    add edi, 1

    mov esi, [ebx + edx * 4]

    cmp eax, esi    ;; verifying if the distance is a perfect square
    jl square_loop

    mov esi, [ebx + edx * 4]

    cmp eax, esi
    jg square_bad
    mov [ecx + 4 * edx], dword 1    ;; the distance is a perfect square
    jmp end_me

square_bad:
    mov [ecx + 4 * edx], dword 0    ;; the distance is a perfect square
    jmp end_me

end_me:
    add edx, 1      ;;iterating through the distances vector
    mov esi, [ebp + 12]
    cmp edx, esi
    jle loop

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY