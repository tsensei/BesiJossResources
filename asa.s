.section .data
data_items:

.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
.section .text
.globl _start
_start:
movl $0, %edi
# move 0 into the index register
movl data_items(,%edi,4), %eax # load the first byte of data
movl %eax, %ebx
# since this is the first item, %eax is
# the biggest
start_loop:
cmpl $0, %eax
je loop_exit
incl %edi
movl data_items(,%edi,4),
cmpl %ebx, %eax
jle start_loop
movl %eax, %ebx
32
# start loop
# check to see if we’ve hit the end
# load next value
%eax
# compare values
# jump to loop beginning if the new
# one isn’t bigger
# move the value as the largestChapter 3. Your First Programs
jmp start_loop
# jump to loop beginning
loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
movl $1, %eax
#1 is the exit() syscall
int $0x80