.globl matmul

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
#     d = matmul(m0, m1)
#   If the dimensions don't match, exit with exit code 2
# Arguments:
#     a0 is the pointer to the start of m0
#    a1 is the # of rows (height) of m0
#    a2 is the # of columns (width) of m0
#    a3 is the pointer to the start of m1
#     a4 is the # of rows (height) of m1
#    a5 is the # of columns (width) of m1
#    a6 is the pointer to the the start of d
# Returns:
#    None, sets d = matmul(m0, m1)
# =======================================================
matmul:

	# Error if mismatched dimensions
	bne a2 a4 mismatched_dimensions
	
    # Prologue
	mv t0 a0
	mv t1 a3
	li t2 0
	li t3 0
	mv t4 a6
	li t5 0
	li t6 0
    li a4 0
    jal x0 inner_loop_start

outer_loop_start:
	
	mul t2 a1 a5
	slli t2 t2 2
	sub t3 t4 a6
	beq t3 t2 outer_loop_end
	slli t2 a2 2
	add a0 a0 t2
	li t5 0
	mv t1 a3
	li t6 0

inner_loop_start:

	lw t2 0(t0)
	lw t3 0(t1)
	mul t2 t2 t3
	add a4 a4 t2
	addi t6 t6 1
	addi t0 t0 4
	slli t3 a5 2
	add t1 t1 t3
	beq t6 a2 inner_loop_end
	jal x0 inner_loop_start

inner_loop_end:

	sw a4 0(t4)
	li a4 0
	addi t4 t4 4
	addi t5 t5 1
	beq t5 a5 outer_loop_start
	mv t0 a0
	mul t3 t3 t6
	sub t1 t1 t3
	addi t1 t1 4
	li t6 0
	jal x0 inner_loop_start



outer_loop_end:


    # Epilogue
    
    
    ret


mismatched_dimensions:
    li a1 2
    jal exit2
