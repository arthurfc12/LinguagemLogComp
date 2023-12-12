
; constantes
SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1
True equ 1
False equ 0

segment .data

formatin: db "%d", 0
formatout: db "%d", 10, 0 ; newline, nul terminator
scanint: times 4 db 0 ; 32-bits integer = 4 bytes

segment .bss  ; variaveis
res RESB 1

section .text
global main ; linux
;global _main ; windows
extern scanf ; linux
extern printf ; linux
;extern _scanf ; windows
;extern _printf; windows
extern fflush ; linux
;extern _fflush ; windows
extern stdout ; linux
;extern _stdout ; windows

; subrotinas if/while
binop_je:
JE binop_true
JMP binop_false

binop_jg:
JG binop_true
JMP binop_false

binop_jl:
JL binop_true
JMP binop_false

binop_false:
MOV EAX, False
JMP binop_exit
binop_true:
MOV EAX, True
binop_exit:
RET

main:

PUSH EBP ; guarda o base pointer
MOV EBP, ESP ; estabelece um novo base pointer

; codigo gerado pelo compilador

PUSH DWORD 0
PUSH DWORD 0
MOV [EBP-4], EAX
MOV EAX, 1
MOV EAX, 1
PUSH EAX
MOV EAX, 3
MOV EAX, 3
POP EBX
SUB EAX, EBX
MOV [EBP-8], EAX
MOV EAX, [EBP-4]
MOV [EBP-4], EAX
MOV EAX, [EBP-8]
IF_1:
MOV EAX, 2
MOV EAX, 2
PUSH EAX
MOV EAX, 1
MOV EAX, 1
POP EBX
CMP EAX, EBX
CALL binop_jl
CMP EAX, False
JE ELSE_1
MOV [EBP-4], EAX
MOV EAX, 2
JMP END_IF_1
ELSE_1:
END_IF_1:
MOV [EBP-4], EAX
MOV EAX, 3
LOOP_2:
MOV EAX, 5
MOV EAX, 5
PUSH EAX
MOV EAX, [EBP-4]
MOV EAX, 3
POP EBX
CMP EAX, EBX
CALL binop_jl
MOV [EBP-3], EBX
CMP DWORD [EBP-3], 5
JE EXIT_2
MOV [EBP-4], EAX
MOV EAX, 1
MOV EAX, 1
PUSH EAX
MOV EAX, [EBP-4]
MOV EAX, 3
POP EBX
ADD EAX, EBX
MOV [EBP-8], EAX
MOV EAX, 1
MOV EAX, 1
PUSH EAX
MOV EAX, [EBP-4]
MOV EAX, 4
POP EBX
SUB EAX, EBX
JMP LOOP_2
EXIT_2:
MOV [EBP-4], EAX
MOV EAX, [EBP-8]
MOV EAX, 3
PUSH EAX
MOV EAX, 2
MOV EAX, 2
POP EBX
IMUL EBX
IF_4:
MOV EAX, 2
MOV EAX, 2
PUSH EAX
MOV EAX, 3
MOV EAX, 3
POP EBX
CMP EAX, EBX
CALL binop_jg
MOV EAX, 1
PUSH EAX
MOV EAX, 2
MOV EAX, 2
PUSH EAX
MOV EAX, 2
MOV EAX, 2
POP EBX
CMP EAX, EBX
CALL binop_je
MOV EAX, 1
POP EBX
OR EAX, EBX
CMP EAX, False
JE ELSE_4
MOV [EBP-4], EAX
MOV EAX, 2
JMP END_IF_4
ELSE_4:
END_IF_4:
IF_5:
MOV EAX, 2
MOV EAX, 2
PUSH EAX
MOV EAX, 3
MOV EAX, 3
POP EBX
CMP EAX, EBX
CALL binop_jg
MOV EAX, 1
PUSH EAX
MOV EAX, 2
MOV EAX, 2
PUSH EAX
MOV EAX, 2
MOV EAX, 2
POP EBX
CMP EAX, EBX
CALL binop_je
MOV EAX, 1
POP EBX
AND EAX, EBX
CMP EAX, False
JE ELSE_5
MOV [EBP-4], EAX
MOV EAX, 2
JMP END_IF_5
ELSE_5:
END_IF_5:

; interrupcao de saida (default)

PUSH DWORD [stdout]
CALL fflush
ADD ESP, 4

MOV ESP, EBP
POP EBP

MOV EAX, 1
XOR EBX, EBX
INT 0x80
