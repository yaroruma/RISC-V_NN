.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 is the pointer to the start of v0
#   a1 is the pointer to the start of v1
#   a2 is the length of the vectors
#   a3 is the stride of v0
#   a4 is the stride of v1
# Returns:
#   a0 is the dot product of v0 and v1
# =======================================================
dot:

    # Prologue
	li t0 0
	li t1 0
	li t2 0
	li t3 0
	li t4 0
	li a3 4

loop_start:
	
	lw t0 0(a0)
	lw t1 0(a1)
	mul t2 t0 t1
	add a0 a0 a3
	add a1 a1 a4
	add t3 t3 t2
	addi t4 t4 1
	beq t4 a2 loop_end
	jal x0 loop_start

loop_end:
	
	mv a0 t2

    # Epilogue

    
    ret
