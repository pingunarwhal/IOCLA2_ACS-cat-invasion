%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    sub ecx, 1
    mov [ebp + 12], ecx

    mov ebx, eax            ;; ebx = points
    mov edi, [ebp + 16]     ;; edi = distances

    xor eax, eax
    xor edx, edx
    xor ecx, ecx    ;; iterator

loop1:
    xor esi, esi

    ;; iterating through the points vector and calculating the distance between
    ;; 2 adjacent points using the code from the previous task
    movzx eax, word [ebx + 4 * ecx + point.y]
    movzx edx, word [ebx + 4 * ecx + 4 + point.y]

    cmp ax, dx
    je dist_y_end

    cmp ax, dx
    jle y1
    sub ax, dx
    mov esi, eax

    jmp dist_x_end
y1:
    cmp ax, dx
    jg y2
    sub dx, ax
    mov esi, edx

    jmp dist_x_end
y2:
dist_y_end:
    mov ax, word [ebx + 4 * ecx  + point.x]
    mov dx, word [ebx + 4 * ecx + 4 + point.x]

    cmp ax, dx
    je dist_x_end

    cmp ax, dx
    jle x1
    sub ax, dx
    mov esi, eax

    jmp dist_x_end
x1:
    cmp ax, dx
    jg x2
    sub dx, ax
    mov esi, edx
x2:
dist_x_end:
    mov [edi + 4 * ecx], esi    ;; storing the resulted distance in the vector

    add ecx, 1
    cmp ecx, [ebp + 12]
    jne loop1

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY