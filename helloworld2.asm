;Author: Connor McDermid
;64-bit NASM program 2
;Compiled using asmlink program as well as
;nasm -felf64 helloworld.asm && ld helloworld.o
%include "Macros_CPsub64.inc" ; macro subroutine libs
%include "CPsub64.inc" 

global  main               ; global entry point export for ld

section .text
main:
	call	Crlf		; perform line feed
	mov	rdx, message 	; load message address	
	call 	WriteString	; perform write to terminal
	; program suspended for write to terminal
	call 	Crlf		; perform line feed
	call	Crlf
	mov 	rdx, goodbye	; load message address
	call 	WriteString	; perform write to terminal
	; program suspended
	call 	Crlf		; perform line feed
	call 	Crlf
	mov 	rdx, looney	; load message address
	call	WriteString	; perform write to terminal
	call 	Crlf		; perform line feed 
	call 	Crlf
    	Exit

section .data
message: db   	"Hello, World!",00h   	; message and NULL-TERMINATOR
length:  equ  	$-message        	; NASM definition pseudo-instruction
goodbye: db 	"Goodbye World!",00h	; goodbye world message and CRLF
gblen: 	 equ 	$-goodbye		; length of goodbye
looney:  db 	"That's All, Folks!",00h	; looney tunes farewell
looneylen: equ 	$-looney		; looney tunes farewell length
