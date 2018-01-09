	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.section	.text,code
.Ltext0:
	.align	2
	.globl	uart4_init
.LFB4 = .
	.file 1 "c:/users/3/desktop/lab4-uart/uart.c"
	.loc 1 41 0
	.set	nomips16
	.set	nomicromips
	.ent	uart4_init
	.type	uart4_init, @function
uart4_init:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-8
.LCFI0 = .
	sw	$fp,4($sp)
.LCFI1 = .
	move	$fp,$sp
.LCFI2 = .
	.loc 1 42 0
	lui	$2,%hi(RPF8R)
	li	$3,2			# 0x2
	sw	$3,%lo(RPF8R)($2)
	.loc 1 43 0
	lui	$2,%hi(U4RXR)
	li	$3,11			# 0xb
	sw	$3,%lo(U4RXR)($2)
	.loc 1 45 0
	lui	$3,%hi(U4STA)
	lw	$2,%lo(U4STA)($3)
	li	$4,1			# 0x1
	ins	$2,$4,10,1
	sw	$2,%lo(U4STA)($3)
	.loc 1 46 0
	lui	$3,%hi(U4STA)
	lw	$2,%lo(U4STA)($3)
	li	$4,1			# 0x1
	ins	$2,$4,12,1
	sw	$2,%lo(U4STA)($3)
	.loc 1 47 0
	lui	$2,%hi(U4BRG)
	li	$3,650			# 0x28a
	sw	$3,%lo(U4BRG)($2)
	.loc 1 48 0
	lui	$3,%hi(U4MODE)
	lhu	$2,%lo(U4MODE)($3)
	li	$4,1			# 0x1
	ins	$2,$4,15,1
	sh	$2,%lo(U4MODE)($3)
	.loc 1 49 0
	move	$sp,$fp
.LCFI3 = .
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	uart4_init
.LFE4:
	.size	uart4_init, .-uart4_init
	.align	2
	.globl	uart4_getc
.LFB5 = .
	.loc 1 63 0
	.set	nomips16
	.set	nomicromips
	.ent	uart4_getc
	.type	uart4_getc, @function
uart4_getc:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-8
.LCFI4 = .
	sw	$fp,4($sp)
.LCFI5 = .
	move	$fp,$sp
.LCFI6 = .
	.loc 1 64 0
	nop
.L3:
	lui	$2,%hi(U4STA)
	lw	$2,%lo(U4STA)($2)
	andi	$2,$2,0x1
	beq	$2,$0,.L3
	nop

	.loc 1 66 0
	lui	$2,%hi(U4RXREG)
	lw	$2,%lo(U4RXREG)($2)
	seb	$2,$2
	.loc 1 67 0
	move	$sp,$fp
.LCFI7 = .
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	uart4_getc
.LFE5:
	.size	uart4_getc, .-uart4_getc
	.align	2
	.globl	uart4_putc
.LFB6 = .
	.loc 1 80 0
	.set	nomips16
	.set	nomicromips
	.ent	uart4_putc
	.type	uart4_putc, @function
uart4_putc:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-8
.LCFI8 = .
	sw	$fp,4($sp)
.LCFI9 = .
	move	$fp,$sp
.LCFI10 = .
	move	$2,$4
	sb	$2,8($fp)
	.loc 1 81 0
	nop
.L6:
	lui	$2,%hi(U4STA)
	lw	$2,%lo(U4STA)($2)
	andi	$2,$2,0x200
	bne	$2,$0,.L6
	nop

	.loc 1 83 0
	lb	$3,8($fp)
	lui	$2,%hi(U4TXREG)
	sw	$3,%lo(U4TXREG)($2)
	.loc 1 84 0
	move	$sp,$fp
.LCFI11 = .
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	uart4_putc
.LFE6:
	.size	uart4_putc, .-uart4_putc
	.align	2
	.globl	uart4_puts
.LFB7 = .
	.loc 1 98 0
	.set	nomips16
	.set	nomicromips
	.ent	uart4_puts
	.type	uart4_puts, @function
uart4_puts:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-24
.LCFI12 = .
	sw	$31,20($sp)
	sw	$fp,16($sp)
.LCFI13 = .
	move	$fp,$sp
.LCFI14 = .
	sw	$4,24($fp)
	.loc 1 99 0
	j	.L8
	nop

.L9:
	.loc 1 100 0
	lw	$2,24($fp)
	addiu	$3,$2,1
	sw	$3,24($fp)
	lb	$2,0($2)
	move	$4,$2
	jal	uart4_putc
	nop

.L8:
	.loc 1 99 0
	lw	$2,24($fp)
	lb	$2,0($2)
	bne	$2,$0,.L9
	nop

	.loc 1 101 0
	move	$sp,$fp
.LCFI15 = .
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	uart4_puts
.LFE7:
	.size	uart4_puts, .-uart4_puts
	.section	.rodata,code
	.align	2
.LC0:
	.ascii	"Hello, please choose LED and then turn on (1), or turn o"
	.ascii	"ff (0) it\015\012\000"
	.align	2
.LC1:
	.ascii	"Please press a key.\015\012\000"
	.section	.text,code
	.align	2
	.globl	uart4_test
.LFB8 = .
	.loc 1 118 0
	.set	nomips16
	.set	nomicromips
	.ent	uart4_test
	.type	uart4_test, @function
uart4_test:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-24
.LCFI16 = .
	sw	$31,20($sp)
	sw	$fp,16($sp)
.LCFI17 = .
	move	$fp,$sp
.LCFI18 = .
	.loc 1 121 0
	lui	$2,%hi(.LC0)
	addiu	$4,$2,%lo(.LC0)
	jal	uart4_puts
	nop

	.loc 1 122 0
	lui	$2,%hi(.LC1)
	addiu	$4,$2,%lo(.LC1)
	jal	uart4_puts
	nop

	.loc 1 131 0
	move	$sp,$fp
.LCFI19 = .
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	uart4_test
.LFE8:
	.size	uart4_test, .-uart4_test
	.section	.debug_frame,info
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0x1f
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI0-.LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI4-.LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI8-.LFB6
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI12-.LFB7
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0x9f
	.uleb128 0x1
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI16-.LFB8
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0x9f
	.uleb128 0x1
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE8:
	.section	.text,code
.Letext0:
	.file 2 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/proc/p32mz2048ecg100.h"
	.section	.debug_info,info
.Ldebug_info0:
	.4byte	0x5e7
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii	"GNU C 4.8.3 MPLAB XC32 Compiler v1.44\000"
	.byte	0x1
	.ascii	"UART.c\000"
	.ascii	"C:/Users/3/Desktop/lab4-UART\000"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"unsigned int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1d52
	.4byte	0x165
	.uleb128 0x4
	.ascii	"STSEL\000"
	.byte	0x2
	.2byte	0x1d53
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"PDSEL\000"
	.byte	0x2
	.2byte	0x1d54
	.4byte	0x63
	.byte	0x4
	.byte	0x2
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"BRGH\000"
	.byte	0x2
	.2byte	0x1d55
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RXINV\000"
	.byte	0x2
	.2byte	0x1d56
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ABAUD\000"
	.byte	0x2
	.2byte	0x1d57
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LPBACK\000"
	.byte	0x2
	.2byte	0x1d58
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"WAKE\000"
	.byte	0x2
	.2byte	0x1d59
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UEN\000"
	.byte	0x2
	.2byte	0x1d5a
	.4byte	0x63
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RTSMD\000"
	.byte	0x2
	.2byte	0x1d5c
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"IREN\000"
	.byte	0x2
	.2byte	0x1d5d
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SIDL\000"
	.byte	0x2
	.2byte	0x1d5e
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ON\000"
	.byte	0x2
	.2byte	0x1d60
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1d62
	.4byte	0x1bf
	.uleb128 0x4
	.ascii	"PDSEL0\000"
	.byte	0x2
	.2byte	0x1d64
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"PDSEL1\000"
	.byte	0x2
	.2byte	0x1d65
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UEN0\000"
	.byte	0x2
	.2byte	0x1d67
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UEN1\000"
	.byte	0x2
	.2byte	0x1d68
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1d6a
	.4byte	0x1f2
	.uleb128 0x4
	.ascii	"USIDL\000"
	.byte	0x2
	.2byte	0x1d6c
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UARTEN\000"
	.byte	0x2
	.2byte	0x1d6e
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1d70
	.4byte	0x20c
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x1d71
	.4byte	0x63
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x1d51
	.4byte	0x22a
	.uleb128 0x6
	.4byte	0x73
	.uleb128 0x6
	.4byte	0x165
	.uleb128 0x6
	.4byte	0x1bf
	.uleb128 0x6
	.4byte	0x1f2
	.byte	0
	.uleb128 0x7
	.ascii	"__U4MODEbits_t\000"
	.byte	0x2
	.2byte	0x1d73
	.4byte	0x20c
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1da4
	.4byte	0x38d
	.uleb128 0x4
	.ascii	"URXDA\000"
	.byte	0x2
	.2byte	0x1da5
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"OERR\000"
	.byte	0x2
	.2byte	0x1da6
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FERR\000"
	.byte	0x2
	.2byte	0x1da7
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"PERR\000"
	.byte	0x2
	.2byte	0x1da8
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RIDLE\000"
	.byte	0x2
	.2byte	0x1da9
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ADDEN\000"
	.byte	0x2
	.2byte	0x1daa
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"URXISEL\000"
	.byte	0x2
	.2byte	0x1dab
	.4byte	0x63
	.byte	0x4
	.byte	0x2
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"TRMT\000"
	.byte	0x2
	.2byte	0x1dac
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXBF\000"
	.byte	0x2
	.2byte	0x1dad
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXEN\000"
	.byte	0x2
	.2byte	0x1dae
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXBRK\000"
	.byte	0x2
	.2byte	0x1daf
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"URXEN\000"
	.byte	0x2
	.2byte	0x1db0
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXINV\000"
	.byte	0x2
	.2byte	0x1db1
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXISEL\000"
	.byte	0x2
	.2byte	0x1db2
	.4byte	0x63
	.byte	0x4
	.byte	0x2
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ADDR\000"
	.byte	0x2
	.2byte	0x1db3
	.4byte	0x63
	.byte	0x4
	.byte	0x8
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ADM_EN\000"
	.byte	0x2
	.2byte	0x1db4
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1db6
	.4byte	0x3f3
	.uleb128 0x4
	.ascii	"URXISEL0\000"
	.byte	0x2
	.2byte	0x1db8
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"URXISEL1\000"
	.byte	0x2
	.2byte	0x1db9
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXISEL0\000"
	.byte	0x2
	.2byte	0x1dbb
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"UTXISEL1\000"
	.byte	0x2
	.2byte	0x1dbc
	.4byte	0x63
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1dbe
	.4byte	0x412
	.uleb128 0x4
	.ascii	"UTXSEL\000"
	.byte	0x2
	.2byte	0x1dc0
	.4byte	0x63
	.byte	0x4
	.byte	0x2
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1dc2
	.4byte	0x42c
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x1dc3
	.4byte	0x63
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x1da3
	.4byte	0x44a
	.uleb128 0x6
	.4byte	0x241
	.uleb128 0x6
	.4byte	0x38d
	.uleb128 0x6
	.4byte	0x3f3
	.uleb128 0x6
	.4byte	0x412
	.byte	0
	.uleb128 0x7
	.ascii	"__U4STAbits_t\000"
	.byte	0x2
	.2byte	0x1dc5
	.4byte	0x42c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"long unsigned int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"long int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x8
	.byte	0x1
	.ascii	"uart4_init\000"
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.uleb128 0x9
	.byte	0x1
	.ascii	"uart4_getc\000"
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.4byte	0x4c2
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii	"char\000"
	.uleb128 0xa
	.byte	0x1
	.ascii	"uart4_putc\000"
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	0x4f6
	.uleb128 0xb
	.ascii	"c\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0x4c2
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.ascii	"uart4_puts\000"
	.byte	0x1
	.byte	0x61
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	0x522
	.uleb128 0xb
	.ascii	"s\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x522
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x4c2
	.uleb128 0xc
	.byte	0x1
	.ascii	"uart4_test\000"
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	0x551
	.uleb128 0xe
	.ascii	"c\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x4c2
	.byte	0
	.uleb128 0xf
	.ascii	"U4RXR\000"
	.byte	0x2
	.2byte	0x465
	.4byte	0x561
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	0x63
	.uleb128 0xf
	.ascii	"RPF8R\000"
	.byte	0x2
	.2byte	0x5df
	.4byte	0x561
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.ascii	"U4MODEbits\000"
	.byte	0x2
	.2byte	0x1d74
	.ascii	"U4MODE\000"
	.4byte	0x592
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	0x22a
	.uleb128 0x11
	.ascii	"U4STAbits\000"
	.byte	0x2
	.2byte	0x1dc6
	.ascii	"U4STA\000"
	.4byte	0x5b1
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	0x44a
	.uleb128 0xf
	.ascii	"U4TXREG\000"
	.byte	0x2
	.2byte	0x1df4
	.4byte	0x561
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.ascii	"U4RXREG\000"
	.byte	0x2
	.2byte	0x1df8
	.4byte	0x561
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.ascii	"U4BRG\000"
	.byte	0x2
	.2byte	0x1dfc
	.4byte	0x561
	.byte	0x1
	.byte	0x1
	.byte	0
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,info
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,info
.Ldebug_line0:
	.section	.debug_str,info
	.ident	"GCC: (Microchip Technology) 4.8.3 MPLAB XC32 Compiler v1.44"
# Begin MCHP vector dispatch table
# End MCHP vector dispatch table
# Microchip Technology PIC32 MCU configuration words