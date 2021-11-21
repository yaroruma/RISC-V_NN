.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array
#	a1 is the # of elements in the array
# Returns:
#	None
# ==============================================================================
relu:
    # Prologue
	li t2 0
	
loop_start:
	lw t1, 0(a0)
	slt t0, x0, t1
	mul t1, t1, t0

loop_continue:
	sw t1, 0(a0)
	addi a0, a0, 4
	addi t2, t2, 1
	beq t2, a1, loop_end
	jal x0, loop_start
	
loop_end:
    # Epilogue

  
	ret
