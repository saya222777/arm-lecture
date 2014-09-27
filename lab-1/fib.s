	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	
	push {r4, r5, lr}	@ put the value into register
	subs r4 ,r0, #1
	bgt .L3
	pop {r4, r5, pc}	@ read the value from register
	bx lr


.L3:
	mov r0,r4		@ Recursive call
	bl fibonacci
	mov r5,r0
	sub r0,r4,#1 
	bl fibonacci		@ Recursive call
	add r0,r5,r0
	pop {r4, r5, pc}

	.size fibonacci, .-fibonacci
	.end
