; asmsyntax=ca65

; == Test file for syntax highlighting ==
; Each command is listed with *all* addressing modes.  Lines
; below the '--' are invalid for that command and should
; display differently.

; Addressing modes
; brk               Implied
; lsr a             Accumulator
; adc #12           Immediate, decimal
; adc #$AB          Immediate, Hex
; adc #ABh          Immediate, Hex (alt)
; adc #%01010101    Immediate, Binary
; adc $2A           Zero Page
; adc $2A, x        Zero Page, x
; adc Oper          Zero Page / Absolute (with label)
; adc Oper, x       Zero Page / Absolute, X (with label)
; adc Oper, y       Zero Page / Absolute, Y (with label)
; adc @LocalLabel   Absolute with local label
; adc $6A2D         Absolute
; adc $6A2D, x      Absolute, X
; adc $6A2D, y      Absolute, Y
; adc ($6A2D, x)    Indirect X (Indexed Indirect)
; adc ($6A2D), y    Indirect Y (Indirect Indexed)
; adc (Oper, x)     Indirect X (Indexed Indirect), with label
; adc (Oper), y     Indirect y (Indirect Indexed), with label
; jmp ($02AB)       Indirect Absolute (straight pointer)
; jmp (Oper)        Indirect Absolute (straight pointer), with label

; Add w/ Cary
    adc #12
    adc #$AB
    adc #%01010101
    adc $2A
    adc $2A, x
    adc Oper
    adc Oper, x
    adc Oper, y

    adc @LocalLabel

    adc $6A2D
    adc $6A2D, x
    adc $6A2D, y

    adc ($6A2D, x)
    adc ($6A2D), y

    adc (Oper, x)
    adc (Oper), y

    ; ------------------
    adc
    adc a
    adc ($02AB)
    adc (Oper)

; Bitwise AND
    and #12
    and #$AB
    and #%01010101
    and $2A
    and Oper
    and Oper, x

    and @LocalLabel

    and $6A2D
    and $6A2D, x
    and $6A2D, y

    and ($6A2D, x)
    and ($6A2D), y

    and (Oper, x)
    and (Oper), y

    ; ------------------
    and
    and a
    and ($02AB)
    and (Oper)

; Left Shift
    asl a
    asl $2A
    asl Oper
    asl Oper, x

    asl @LocalLabel

    asl $6A2D
    asl $6A2D, x

    ; ------------------
    asl
    asl #12
    asl #$AB
    asl #%01010101

    asl $6A2D, y

    asl ($6A2D, x)
    asl ($6A2D), y

    asl (Oper, x)
    asl (Oper), y

    asl ($02AB)
    asl (Oper)

; Branch on carry clear
    bcc $2A
    bcc GlobalLabel
    bcc @LocalLabel

    ; ------------------
    bcc
    bcc a

    bcc #12
    bcc #$AB
    bcc #%01010101

    bcc Oper, x

    bcc $6A2D
    bcc $6A2D, x

    bcc $6A2D, y

    bcc ($6A2D, x)
    bcc ($6A2D), y

    bcc (Oper, x)
    bcc (Oper), y

    bcc ($02AB)
    bcc (Oper)

; Branch on result zero
    beq $2A
    beq GlobalLabel
    beq @LocalLabel

    ; ------------------
    beq
    beq a

    beq #12
    beq #$AB
    beq #%01010101

    beq Oper, x

    beq $6A2D
    beq $6A2D, x

    beq $6A2D, y

    beq ($6A2D, x)
    beq ($6A2D), y

    beq (Oper, x)
    beq (Oper), y

    beq ($02AB)
    beq (Oper)

; Bit test
    bit $2A
    bit $6A2D

    bit GlobalLabel
    bit @LocalLabel

    ; ------------------
    bit
    bit a

    bit #12
    bit #$AB
    bit #%01010101

    bit Oper, x

    bit $6A2D, x

    bit $6A2D, y

    bit ($6A2D, x)
    bit ($6A2D), y

    bit (Oper, x)
    bit (Oper), y

    bit ($02AB)
    bit (Oper)

; Branch on result minus
    bmi $2A
    bmi GlobalLabel
    bmi @LocalLabel

    ; ------------------
    bmi
    bmi a

    bmi #12
    bmi #$AB
    bmi #%01010101

    bmi Oper, x

    bmi $6A2D
    bmi $6A2D, x

    bmi $6A2D, y

    bmi ($6A2D, x)
    bmi ($6A2D), y

    bmi (Oper, x)
    bmi (Oper), y

    bmi ($02AB)
    bmi (Oper)

; Branch on result not zero
    bne $2A
    bne GlobalLabel
    bne @LocalLabel

    ; ------------------
    bne
    bne a

    bne #12
    bne #$AB
    bne #%01010101

    bne Oper, x

    bne $6A2D
    bne $6A2D, x

    bne $6A2D, y

    bne ($6A2D, x)
    bne ($6A2D), y

    bne (Oper, x)
    bne (Oper), y

    bne ($02AB)
    bne (Oper)

; Branch on result plus
    bpl $2A
    bpl GlobalLabel
    bpl @LocalLabel

    ; ------------------
    bpl
    bpl a

    bpl #12
    bpl #$AB
    bpl #%01010101

    bpl Oper, x

    bpl $6A2D
    bpl $6A2D, x

    bpl $6A2D, y

    bpl ($6A2D, x)
    bpl ($6A2D), y

    bpl (Oper, x)
    bpl (Oper), y

    bpl ($02AB)
    bpl (Oper)

; Force break
    brk

    ; ------------------
    brk a

    brk $2A
    brk GlobalLabel
    brk @LocalLabel

    brk #12
    brk #$AB
    brk #%01010101

    brk Oper, x

    brk $6A2D
    brk $6A2D, x

    brk $6A2D, y

    brk ($6A2D, x)
    brk ($6A2D), y

    brk (Oper, x)
    brk (Oper), y

    brk ($02AB)
    brk (Oper)

; Branch on overflow clear
    bvc $2A
    bvc GlobalLabel
    bvc @LocalLabel

    ; ------------------
    bvc
    bvc a

    bvc #12
    bvc #$AB
    bvc #%01010101

    bvc Oper, x

    bvc $6A2D
    bvc $6A2D, x

    bvc $6A2D, y

    bvc ($6A2D, x)
    bvc ($6A2D), y

    bvc (Oper, x)
    bvc (Oper), y

    bvc ($02AB)
    bvc (Oper)

; Branch on overflow set
    bvs $2A
    bvs GlobalLabel
    bvs @LocalLabel

    ; ------------------
    bvs
    bvs a

    bvs #12
    bvs #$AB
    bvs #%01010101

    bvs Oper, x

    bvs $6A2D
    bvs $6A2D, x

    bvs $6A2D, y

    bvs ($6A2D, x)
    bvs ($6A2D), y

    bvs (Oper, x)
    bvs (Oper), y

    bvs ($02AB)
    bvs (Oper)

; Clear cary
    clc

    ; ------------------
    clc a

    clc $2A
    clc GlobalLabel
    clc @LocalLabel

    clc #12
    clc #$AB
    clc #%01010101

    clc Oper, x

    clc $6A2D
    clc $6A2D, x

    clc $6A2D, y

    clc ($6A2D, x)
    clc ($6A2D), y

    clc (Oper, x)
    clc (Oper), y

    clc ($02AB)
    clc (Oper)

; Clear decimal mode
    cld

    ; ------------------
    cld a

    cld $2A
    cld GlobalLabel
    cld @LocalLabel

    cld #12
    cld #$AB
    cld #%01010101

    cld Oper, x

    cld $6A2D
    cld $6A2D, x

    cld $6A2D, y

    cld ($6A2D, x)
    cld ($6A2D), y

    cld (Oper, x)
    cld (Oper), y

    cld ($02AB)
    cld (Oper)

; Clear interrupt disable bit
    cli

    ; ------------------
    cli a

    cli $2A
    cli GlobalLabel
    cli @LocalLabel

    cli #12
    cli #$AB
    cli #%01010101

    cli Oper, x

    cli $6A2D
    cli $6A2D, x

    cli $6A2D, y

    cli ($6A2D, x)
    cli ($6A2D), y

    cli (Oper, x)
    cli (Oper), y

    cli ($02AB)
    cli (Oper)

; Compare memory and accumulator
    cmp #12
    cmp #$AB
    cmp #%01010101
    cmp $2A
    cmp $2A, x
    cmp Oper
    cmp Oper, x
    cmp Oper, y

    cmp @LocalLabel

    cmp $6A2D
    cmp $6A2D, x
    cmp $6A2D, y

    cmp ($6A2D, x)
    cmp ($6A2D), y

    cmp (Oper, x)
    cmp (Oper), y

    ; ------------------
    cmp
    cmp a
    cmp ($02AB)
    cmp (Oper)

; Compare memory and X
    cpx #12
    cpx #$AB
    cpx #%01010101
    cpx $2A
    cpx $6A2D

    cpx Oper
    cpx @LocalLabel

    ; ------------------
    cpx
    cpx a
    cpx $2A, x
    cpx Oper, x
    cpx Oper, y

    cpx $6A2D, x
    cpx $6A2D, y

    cpx ($6A2D, x)
    cpx ($6A2D), y

    cpx (Oper, x)
    cpx (Oper), y

    cpx ($02AB)
    cpx (Oper)

; Compare memory and Y
    cpy #12
    cpy #$AB
    cpy #%01010101
    cpy $2A
    cpy $6A2D

    cpy Oper
    cpy @LocalLabel

    ; ------------------
    cpy
    cpy a
    cpy $2A, x
    cpy Oper, x
    cpy Oper, y

    cpy $6A2D, x
    cpy $6A2D, y

    cpy ($6A2D, x)
    cpy ($6A2D), y

    cpy (Oper, x)
    cpy (Oper), y

    cpy ($02AB)
    cpy (Oper)


; == ca65 ==
; The following lines are for ca65 pseudo functions,
; pseudo variables, and commands.

; Pseudo Variables
    .asize
    .cpu
    .isize
    .paramcount
    .time
    .version

; Pseudo Functions
    .addrsize(foo)
    ;.bank(foo)     ; pretty sure this one won't work on the NES
    ;.bankbyte      ; same as above
    .blank(arg)

    .concat("foo", ".", "bar")
    .concat("foo", "bar")
    .concat(arg1, arg2)

    .const(foo + 2)
    .highbite(foo)
    .hiword(foo)
    .ident(.concat(arg1, arg2))

    .left(2, foo)
    .left(2, {arg})

    .lobyte(foo)
    .loword(foo)

    .match({arg}, a))
    .max(foo, bar)

