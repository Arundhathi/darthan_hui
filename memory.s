	.arch armv7-a
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"memory.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"error:mem move not possible \000"
	.text
	.align	2
	.global	my_memmove
	.syntax unified
	.thumb
	.thumb_func
	.type	my_memmove, %function
my_memmove:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	strb	r3, [r7, #23]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bcc	.L2
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r2, r2, r3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcs	.L3
.L2:
	movs	r3, #0
	strb	r3, [r7, #23]
	b	.L4
.L5:
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	ldr	r1, [r7, #12]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	adds	r3, r3, #1
	strb	r3, [r7, #23]
.L4:
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L5
	movs	r3, #1
	b	.L6
.L3:
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	movs	r3, #0
.L6:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	my_memmove, .-my_memmove
	.section	.rodata
	.align	2
.LC1:
	.ascii	"error:move failed\000"
	.text
	.align	2
	.global	my_memzero
	.syntax unified
	.thumb
	.thumb_func
	.type	my_memzero, %function
my_memzero:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L8
.L9:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L8:
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L9
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L10
.L12:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L11
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L11:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L10:
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L12
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L13
	movs	r3, #1
	b	.L14
.L13:
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	movs	r3, #0
.L14:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	my_memzero, .-my_memzero
	.align	2
	.global	my_reverse
	.syntax unified
	.thumb
	.thumb_func
	.type	my_reverse, %function
my_reverse:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	str	r3, [r7, #16]
	ldr	r3, [r7]
	subs	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	str	r3, [r7, #20]
	ldr	r3, [r7]
	rsb	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	movs	r0, #10
	bl	putchar
	b	.L16
.L17:
	ldr	r3, [r7, #16]
	ldrb	r3, [r3]
	strb	r3, [r7, #15]
	ldr	r3, [r7, #20]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #16]
	strb	r2, [r3]
	ldr	r3, [r7, #20]
	ldrb	r2, [r7, #15]
	strb	r2, [r3]
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	subs	r3, r3, #1
	str	r3, [r7, #20]
.L16:
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bls	.L17
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	my_reverse, .-my_reverse
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.1) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits
