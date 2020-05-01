.model small
.stack 100h
.data
	msg0 db "Difference: $"
	msg1 db "Enter 1st number: $"
	msg2 db "Enter 2nd number: $"
	num1 db ?
	num2 db ?
	lnfd db 0ah, 0dh, "$"
.code
	mov ax, @data
	mov ds, ax

	mov ax, 0003h
	int 10h

	mov ah, 09h
	mov dx, offset msg1
	int 21h

	mov ah, 01h
	int 21h
	mov num1, al

	mov ah, 09h
	mov dx, offset lnfd
	int 21h
	mov dx, offset msg2
	int 21h

	mov ah, 01h
	int 21h
	mov num2, al 
	mov al, num1

	; ex input : 9-1
	
	cmp num2, al ; compare the num2 with value of al. 
	jg negativ  ; 9 < 1 skip
	cmp num2, al ; compare if num1 is greater than number 2 is 9 > 1? yes perform jle
	jle positiv ; 9 < 1 fits 
	
negativ:	sub num2, al ; subtract num2 from al 
			mov al, num2

			mov ah, 09h
			mov dx, offset lnfd
			int 21h
			mov dx, offset msg0
			int 21h

			mov ah, 02h
			mov bl, al
			mov dl, "-"
			int 21h
			mov al, bl
			add al, 30h
			mov dl, al
			int 21h

			jmp exit

positiv:	sub al, num2 ; subtract num2 from al ; 39 - 31 = 08
			mov ah, 09h
			mov dx, offset lnfd
			int 21h
			mov dx, offset msg0
			int 21h

			mov ah, 02h
			add al, 30h ; to show decimal 30 + 08 = 38; 38 in ascii is 8
			mov dl, al
			int 21h

			jmp exit

exit:	mov ax, 4c00h
		int 21h
		
end