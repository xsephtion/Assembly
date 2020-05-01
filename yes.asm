	.model small
	.code
	org 100h
start:
		jmp main
		msg1 db "Type yes$"
		msg2 db "Wrong input!$"
		msg3 db "Input Correct!$"
		nwln db 0AH, 0DH, 24H
main:  
		mov ah,9
		lea dx,nwln
		int 21h
		mov ah,9
		lea dx,msg1
		int 21h
		mov ah,9
		lea dx,nwln
		int 21h
		mov ah,1
		int 21h
		mov bl,al
		int 21h
		mov bh,al
		int 21h
		mov ch,al
		int 21h
		cmp bl,79h	
		jb invalid 
		ja invalid  		
		cmp bh,64h
		jbe invalid 
		cmp bh,66h
		jae invalid
		cmp ch,73h
		jb invalid 
		ja invalid 
		jmp correct
		
	invalid:
			mov ah,9
			lea dx, nwln
			int 21h
			mov ah,9
			lea dx,msg2
			int 21h
			mov ah,9
			lea dx,nwln
			int 21h	
			jmp exit
	correct:
			mov ah,9
			lea dx, msg3
			int 21h
			mov ah,9
			lea dx, nwln
			int 21h
			jmp exit
	exit:
			int 20h
end start