
	.machine ppc
	.section	".text"
	.section	.rodata
	.align 2
.LC0:
	.string	"hello world"
	.section	".got2","aw"
	.align 2
.LCTOC1 = .+32768
.LC1:
	.long .LC0
	.section	".text"
	.align 2
	.globl hello
	.type	hello, @function
hello:
.LFB6:
	.cfi_startproc
	stwu 1,-16(1)
	.cfi_def_cfa_offset 16
	mflr 0
	stw 0,20(1)
	stw 30,8(1)
	stw 31,12(1)
	.cfi_offset 65, 4
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L3
.L3:
	mflr 30
	addis 30,30,.LCTOC1-.L3@ha
	addi 30,30,.LCTOC1-.L3@l
	lwz 9,.LC1-.LCTOC1(30)
	mr 3,9
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE6:
	.size	hello,.-hello
	.section	.rodata
	.align 2
.LC2:
	.string	"\033[43;37m%s....\n"
	.section	".got2","aw"
.LC3:
	.long .LC2
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	stwu 1,-32(1)
	.cfi_def_cfa_offset 32
	mflr 0
	stw 0,36(1)
	stw 30,24(1)
	stw 31,28(1)
	.cfi_offset 65, 4
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L6
.L6:
	mflr 30
	addis 30,30,.LCTOC1-.L6@ha
	addi 30,30,.LCTOC1-.L6@l
	lwz 9,.LC3-.LCTOC1(30)
	stw 9,8(31)
	bl hello@local
	mr 9,3
	mr 4,9
	lwz 3,8(31)
	crxor 6,6,6
	bl printf+32768@plt
	li 9,0
	mr 3,9
	addi 11,31,32
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE7:

