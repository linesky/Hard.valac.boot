
	.machine ppc
	.section	".text"
	.align 2
	.globl adds
	.type	adds, @function
adds:
.LFB6:
	.cfi_startproc
	stwu 1,-32(1)
	.cfi_def_cfa_offset 32
	stw 31,28(1)
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,8(31)
	stw 4,12(31)
	lwz 10,8(31)
	lwz 9,12(31)
	add 9,10,9
	mr 3,9
	addi 11,31,32
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE6:
	.size	adds,.-adds
	.section	.rodata
	.align 2
.LC0:
	.string	"\033[43;37m%d....\n"
	.section	".got2","aw"
	.align 2
.LCTOC1 = .+32768
.LC1:
	.long .LC0
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
	bcl 20,31,.L5
.L5:
	mflr 30
	addis 30,30,.LCTOC1-.L5@ha
	addi 30,30,.LCTOC1-.L5@l
	li 9,10
	stw 9,8(31)
	li 9,5
	stw 9,12(31)
	lwz 9,.LC1-.LCTOC1(30)
	stw 9,16(31)
	lwz 4,12(31)
	lwz 3,8(31)
	bl adds@local
	mr 9,3
	mr 4,9
	lwz 3,16(31)
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

