
	.machine ppc
	.section	".text"
	.align 2
	.globl strslen
	.type	strslen, @function
strslen:
.LFB0:
	.cfi_startproc
	stwu 1,-48(1)
	.cfi_def_cfa_offset 48
	stw 31,44(1)
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,24(31)
	li 9,0
	stw 9,8(31)
	b .L2
.L3:
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L2:
	lwz 9,8(31)
	lwz 10,24(31)
	add 9,10,9
	lbz 9,0(9)
	cmpwi 0,9,0
	bne 0,.L3
	lwz 9,8(31)
	mr 3,9
	addi 11,31,48
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE0:
	.size	strslen,.-strslen
	.align 2
	.globl strcats
	.type	strcats, @function
strcats:
.LFB1:
	.cfi_startproc
	stwu 1,-48(1)
	.cfi_def_cfa_offset 48
	mflr 0
	stw 0,52(1)
	stw 31,44(1)
	.cfi_offset 65, 4
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,24(31)
	stw 4,28(31)
	li 9,0
	stw 9,8(31)
	lwz 3,24(31)
	bl strslen@local
	mr 9,3
	mr 10,9
	lwz 9,24(31)
	add 9,9,10
	stw 9,12(31)
	b .L6
.L7:
	lwz 9,8(31)
	lwz 10,28(31)
	add 10,10,9
	lwz 9,8(31)
	lwz 8,12(31)
	add 9,8,9
	lbz 10,0(10)
	stb 10,0(9)
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L6:
	lwz 9,8(31)
	lwz 10,28(31)
	add 9,10,9
	lbz 9,0(9)
	cmpwi 0,9,0
	bne 0,.L7
	lwz 9,8(31)
	lwz 10,28(31)
	add 10,10,9
	lwz 9,8(31)
	lwz 8,12(31)
	add 9,8,9
	lbz 10,0(10)
	stb 10,0(9)
	lwz 9,8(31)
	mr 3,9
	addi 11,31,48
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE1:
	.size	strcats,.-strcats
	.section	.rodata
	.align 2
.LC0:
	.string	"hello "
	.align 2
.LC2:
	.string	"world \n "
	.align 2
.LC4:
	.string	"\033[43;37m%s  \n"
	.section	".got2","aw"
	.align 2
.LCTOC1 = .+32768
.LC1:
	.long .LC0
.LC3:
	.long .LC2
.LC5:
	.long .LC4
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	stwu 1,-80(1)
	.cfi_def_cfa_offset 80
	mflr 0
	stw 0,84(1)
	stw 30,72(1)
	stw 31,76(1)
	.cfi_offset 65, 4
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L11
.L11:
	mflr 30
	addis 30,30,.LCTOC1-.L11@ha
	addi 30,30,.LCTOC1-.L11@l
	li 9,0
	stb 9,8(31)
	lwz 4,.LC1-.LCTOC1(30)
	addi 9,31,8
	mr 3,9
	bl strcats@local
	lwz 4,.LC3-.LCTOC1(30)
	addi 9,31,8
	mr 3,9
	bl strcats@local
	addi 9,31,8
	mr 4,9
	lwz 3,.LC5-.LCTOC1(30)
	crxor 6,6,6
	bl printf+32768@plt
	li 9,0
	mr 3,9
	addi 11,31,80
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
.LFE2:

