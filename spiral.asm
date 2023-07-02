%include "../include/io.mac"

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    push eax
    imul eax, eax
    mov edi, eax    ;; edi = N * N
    pop eax

    ;; copying the plain string in the encryped string
    push ecx
    xor ecx, ecx

    push eax
    xor eax, eax

copy:
    mov al, [ebx + ecx]
    mov [edx + ecx], al
    add ecx, 1
    cmp ecx, edi
    jne copy

    pop eax

    pop ecx

    xor ebx, ebx    ;; ebx = i
    xor edi, edi    ;; edi = k
    xor esi, esi    ;; esi = l

    push eax    ;; esp + 4 = number of lines (n)
    push eax    ;; esp = number of columns (m)
    xor eax, eax    ;; eax = string iterator

big_while:

    mov ebx, esi    ;; i = l
    jmp verify1

first_row:
    push esi
    xor esi, esi

    push edi

    imul edi, [ebp + 8]
    add edi, ebx
    imul edi, 4

    movzx esi, byte [ecx + edi]
    add [edx + eax], esi ;; enc[eax] += key[k][i]

    pop edi

    pop esi

    add eax, 1
    add ebx, 1

verify1:
    cmp ebx, [esp + 4]  ;; i < n
    jl first_row

    add edi, 1  ;; k++

    push esi
    mov esi, [esp + 8]  ;; temporary esi = n
    sub esi, 1

    mov ebx, edi    ;; i = k
    jmp verify2

last_column:
    push edi
    xor edi, edi

    push ebx

    imul ebx, [ebp + 8]
    add ebx, esi
    imul ebx, 4

    movzx edi, byte [ecx + ebx]

    push ebx
    xor ebx, ebx 

    mov bl, [edx + eax]
    add ebx, edi    ;; enc[eax] += key[i][n - 1]
    mov [edx + eax], bl

    pop ebx

    pop ebx

    pop edi

    add eax, 1
    add ebx, 1

verify2:
    cmp ebx, [esp + 4]  ;; i < m
    jl last_column

    pop esi ;; back to esi = l

    sub dword [esp + 4], 1    ;; n--

    cmp edi, [esp]  ;; k < m
    jge endif

    mov ebx, [esp + 4]
    sub ebx, 1      ;; i = n - 1

    push edi
    mov edi, [esp + 4]  ;; temporary edi = m
    sub edi, 1

    jmp verify3

last_row:
    push esi
    xor esi, esi

    push edi

    imul edi, [ebp + 8]
    add edi, ebx
    imul edi, 4

    movzx esi, byte [ecx + edi]

    push ebx
    xor ebx, ebx
    mov bl, [edx + eax]
    add ebx, esi    ;; enc[eax] += key[m - 1][i]
    mov [edx + eax], bl

    pop ebx

    pop edi

    pop esi

    add eax, 1
    sub ebx, 1
verify3:
    cmp ebx, esi    ;;  i >= l
    jge last_row

    pop edi     ;; back to edi = k

    sub dword [esp], 1    ;; m--

endif:

    cmp esi, [esp + 4]      ;; l < n
    jge endif_endme

    mov ebx, [esp]
    sub ebx, 1      ;; i = m - 1
    jmp verify4

first_column:
    push edi
    xor edi, edi

    push ebx

    imul ebx, [ebp + 8]
    add ebx, esi
    imul ebx, 4

    movzx edi, byte [ecx + ebx]

    push ebx
    xor ebx, ebx
    mov bl, [edx + eax]
    add ebx, edi    ;; enc[eax] += key[i][l]
    mov [edx + eax], bl

    pop ebx

    pop ebx

    pop edi

    add eax, 1
    sub ebx, 1

verify4:
    cmp ebx, edi    ;; i >= k
    jge first_column

    add esi, 1  ;; l++

endif_endme:

    cmp edi, [esp]  ;; k < m
    jge end_loop

    cmp esi, [esp + 4]
    jl big_while

end_loop:

    pop eax
    pop eax

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
