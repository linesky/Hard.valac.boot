
	.machine ppc
	.section	".text"
	.section	.rodata
	.align 2
.LC0:
	.string	"0123456789ABCDEF0123456789ABCDEF"
	.section	".got2","aw"
	.align 2
.LCTOC1 = .+32768
.LC1:
	.long .LC0
	.section	".text"
	.align 2
	.globl strshex
	.type	strshex, @function
strshex:
.LFB0:
	.cfi_startproc
	stwu 1,-64(1)
	.cfi_def_cfa_offset 64
	mflr 0
	stw 0,68(1)
	stw 30,56(1)
	stw 31,60(1)
	.cfi_offset 65, 4
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L4
.L4:
	mflr 30
	addis 30,30,.LCTOC1-.L4@ha
	addi 30,30,.LCTOC1-.L4@l
	stw 3,40(31)
	stw 4,44(31)
	lwz 9,44(31)
	stw 9,8(31)
	li 9,8
	stw 9,12(31)
	li 9,0
	stw 9,16(31)
	li 9,16
	stw 9,20(31)
	li 9,15
	stw 9,24(31)
	lwz 9,.LC1-.LCTOC1(30)
	stw 9,28(31)
	lwz 9,12(31)
	lwz 10,40(31)
	add 9,10,9
	li 10,0
	stb 10,0(9)
	li 9,7
	stw 9,12(31)
	b .L2
.L3:
	lwz 10,8(31)
	lwz 9,24(31)
	and 9,10,9
	stw 9,16(31)
	lwz 9,16(31)
	lwz 10,28(31)
	add 10,10,9
	lwz 9,12(31)
	lwz 8,40(31)
	add 9,8,9
	lbz 10,0(10)
	stb 10,0(9)
	lwz 10,8(31)
	lwz 9,20(31)
	divw 9,10,9
	stw 9,8(31)
	lwz 9,12(31)
	addi 9,9,-1
	stw 9,12(31)
.L2:
	lwz 9,12(31)
	cmpwi 0,9,0
	bge 0,.L3
	nop
	nop
	addi 11,31,64
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
.LFE0:
	.size	strshex,.-strshex
	.section	.rodata
	.align 2
.LC2:
	.string	"\033[43;37m%s  \n"
	.section	".got2","aw"
.LC3:
	.long .LC2
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB1:
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
	bcl 20,31,.L7
.L7:
	mflr 30
	addis 30,30,.LCTOC1-.L7@ha
	addi 30,30,.LCTOC1-.L7@l
	li 9,0
	stw 9,8(31)
	addi 10,31,12
	lis 9,0x1234
	ori 4,9,0x5678
	mr 3,10
	bl strshex@local
	addi 9,31,12
	mr 4,9
	lwz 3,.LC3-.LCTOC1(30)
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
.LFE1:

