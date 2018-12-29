	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"stack0.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"you have changed the 'modified' variable\000"
	.align	2
.LC1:
	.ascii	"Try again?\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-8]
	sub	r3, fp, #72
	mov	r0, r3
	bl	gets
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L2
	ldr	r0, .L5
	bl	puts
	b	.L3
.L2:
	ldr	r0, .L5+4
	bl	puts
.L3:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
