.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:

    addi a0 a0 36
    li t1 9
    li t2 0
    li t3 0

loop_start:

    bltz t1 loop_end
    lw a1 0(a0)
    ble t2 a1 loop_continue
    addi t1 t1 -1
    addi a0 a0 -4
    jal x0 loop_start


loop_continue:

    mv t2 a1
    mv t3 t1
    addi t1 t1 -1
    addi a0 a0 -4
    jal x0 loop_start

loop_end:

    mv a0 t3

    ret