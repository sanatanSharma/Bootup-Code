print_string:
    pusha

loop:
    mov   al, [bx]    ; load what `bx` points to
    cmp   al, 0
    je    return
    push  bx          ; save bx
    mov   ah, 0x0e    ; load this every time through the loop
                      ; you don't know if `int` preserves it
    int   0x10
    pop   bx          ; restore bx
    inc   bx
    jmp   loop

return:
    popa
    ret