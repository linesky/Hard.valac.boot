
	.machine ppc
	.section	".text"
	.align 2
	.globl cfill
	.type	cfill, @function
cfill:
.LFB0:
	.cfi_startproc
	stwu 1,-48(1)
	.cfi_def_cfa_offset 48
	mflr 0
	stw 0,52(1)
	stw 30,40(1)
	stw 31,44(1)
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
	stw 3,24(31)
	mr 9,4
	stw 5,32(31)
	stb 9,28(31)
	li 9,0
	stw 9,8(31)
	lwz 3,24(31)
	bl strlen+32768@plt
	mr 9,3
	srwi 9,9,1
	stw 9,12(31)
	lwz 9,32(31)
	srawi 9,9,1
	addze 9,9
	stw 9,16(31)
	li 9,0
	stw 9,8(31)
	b .L2
.L3:
	lwz 10,12(31)
	lwz 9,16(31)
	subf 10,9,10
	lwz 9,8(31)
	add 9,10,9
	mr 10,9
	lwz 9,24(31)
	add 9,9,10
	lbz 10,28(31)
	stb 10,0(9)
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L2:
	lwz 10,8(31)
	lwz 9,32(31)
	cmpw 0,10,9
	blt 0,.L3
	nop
	nop
	addi 11,31,48
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
	.section	".got2","aw"
	.align 2
.LCTOC1 = .+32768
	.section	".text"
	.cfi_endproc
.LFE0:
	.size	cfill,.-cfill
	.section	.rodata
	.align 2
.LC2:
	.string	"\033[43;37m%s \n"
	.align 2
.LC0:
	.string	"hello world\n"
	.zero	67
	.section	".got2","aw"
.LC1:
	.long .LC0
.LC3:
	.long .LC2
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	stwu 1,-96(1)
	.cfi_def_cfa_offset 96
	mflr 0
	stw 0,100(1)
	stw 30,88(1)
	stw 31,92(1)
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
	lwz 9,.LC1-.LCTOC1(30)
	lwz 7,0(9)
	lwz 8,4(9)
	lwz 10,8(9)
	lbz 9,12(9)
	stw 7,8(31)
	stw 8,12(31)
	stw 10,16(31)
	stb 9,20(31)
	addi 9,31,21
	li 10,67
	mr 5,10
	li 4,0
	mr 3,9
	bl memset+32768@plt
	li 5,3
	li 4,46
	addi 9,31,8
	mr 3,9
	bl cfill@local
	addi 9,31,8
	mr 4,9
	lwz 3,.LC3-.LCTOC1(30)
	crxor 6,6,6
	bl printf+32768@plt
	li 9,0
	mr 3,9
	addi 11,31,96
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

