	.global main
	.global L3
	.global L2
	.text
main:
	cmpl $2, %edi // je verifie si j'ai autre chose que un seul argument erreur
	jne L2

	movq %rsi, %rbx // rsi est le message lu par write
	addq $8, %rbx
	movq (%rbx), %rsi  // dans rsi j'ai stocké le nom du fichier



	movq %rsi, %rdi
	movl $0, %eax
	movl $0, %esi
	
	call open
	cmpl $-1, %eax   //je verifie que le fichier a été ouvert
	je L3
	
    movq %rsp, %rbp
    subq $64, %rsp // stack pour stocker mon buffer	
	

	movl %eax, %r8d  // je stock le numero du fd

// tant que mon read ne me renvoie pas -1 je read et je write
.loop:
	movl %r8d, %edi  //je passe le fd en 1 er arg
	
	movq -32(%rbp), %rsi // je passe le buffer en argument
	
	movl $32, %edx  // je veux lire 32 octets
	call read

	cmpl $0, %eax  // si fin du fichier alors je termine
	je end


/* write  */
	movq -32(%rbp), %rsi
	movl %eax, %edx    // ecrire 32 par 32 octets
	movl $1, %edi    // sortie du write sur stdout

	call write
	jmp .loop
	
end :
/* close*/	
	movl %r8d, %edi
	call close
	mov $0, %rax
	addq $64, %rsp
	ret

L2:
	mov $1, %rax
	ret

L3:
	mov $2, %rax
	ret
