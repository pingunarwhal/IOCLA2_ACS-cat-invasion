%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor eax, eax
    xor edx, edx

    ;; getting the y coordinates of the points
    mov ax, word [ebx + point.y]
    mov dx, word [ebx + 4 + point.y]

    cmp ax, dx
    ;; if the y coordinates are equal, the distance is given by the x coordinates
    je dist_y_end
    cmp ax, dx
    ;; if the first y is lower, subtract it from the second one
    jle y1
    ;; if the second y is lower, subtract it from the first one
    sub ax, dx
    jmp dist_x_end
y1:
    cmp ax, dx
    jg y2
    sub dx, ax
    mov ax, dx  ;; distance is stored in eax
    jmp dist_x_end
y2:
dist_y_end:

    ;; getting the y coordinates of the points
    mov ax, word [ebx + point.x]
    mov dx, word [ebx + 4 + point.x]

    cmp ax, dx
    ;; if the points coincide, the distance is 0
    je dist_x_end
    cmp ax, dx
    ;; if the first x is lower, subtract it from the second one
    jle x1
    ;; if the second y is lower, subtract it from the first one
    sub ax, dx
    jmp dist_x_end
x1:
    cmp ax, dx
    jg x2
    sub dx, ax
    mov ax, dx
x2:
dist_x_end:
    mov edx, [ebp + 12]
    mov [edx], eax      ;; storing the distance value at its respective pointer

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY