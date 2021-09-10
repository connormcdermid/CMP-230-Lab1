;Author: Connor McDermid
;64-bit NASM program
;Compiled using asmlink program as well as
;nasm -felf64 helloworld.asm && ld helloworld.o

global  main               ; global entry point export for ld

section .text
main:
  
    	mov	rax, 1          ; sys_write
    	mov    	rdi, 1          ; stdout
    	mov    	rsi, message    ; message address
    	mov    	rdx, length     ; message string length
    	syscall
; program suspended waiting for write to terminal

	mov	rax, 1		; sys_write
	mov	rdi, 1		; stdout
	mov	rsi, goodbye	; message address
	mov 	rdx, gblen	; message length
	syscall
; program suspended waiting for write to terminal

	mov	rax, 1		; sys_write
	mov	rdi, 1 		; stdout
	mov	rsi, looney	; message address
	mov	rdx, looneylen	; message length
	syscall
; program suspended waiting for write to terminal
 
    	mov    	rax, 60         ; sys_exit
    	xor    	rdi, rdi        ; return 0 (success)
    	syscall

section .data
message: db   	0Dh,0Ah,'Hello, World!',0Dh,0Ah,0Dh,0Ah   ; message and CRLF
length:  equ  	$-message        ; NASM definition pseudo-instruction
goodbye: db 	'Goodbye World1',0Dh,0Ah,0Dh,0Ah	; goodbye world message and CRLF
gblen: 	 equ 	$-goodbye	; length of goodbye
looney:  db 	"That's All, Folks!",0Dh,0Ah,0Dh,0Ah	; looney tunes farewell
looneylen: equ 	$-looney		; looney tunes farewell length
