#####################
#	Author:	    #
#   Vadym Filipov   #
#####################
        .data		       # Entering to data defination zone of our program
################################ Set of HEX numbers
n0h:         .byte 	'0'
n1h:         .byte 	'1'
n2h:         .byte 	'2'
n3h:         .byte 	'3'
n4h:         .byte 	'4'
n5h:         .byte 	'5'
n6h:         .byte 	'6'
n7h:         .byte 	'7'
n8h:         .byte 	'8'
n9h:         .byte 	'9'
n10h:        .byte 	'A'
n11h:        .byte 	'B'
n12h:        .byte 	'C'
n13h:        .byte 	'D'
n14h:        .byte 	'E'
n15h:        .byte 	'F'
################################# Set of Binary numbers
n0b:         .asciiz 	"0000"
n1b:         .asciiz 	"0001"
n2b:         .asciiz 	"0010"
n3b:         .asciiz 	"0011"
n4b:         .asciiz 	"0100"
n5b:         .asciiz 	"0101"
n6b:         .asciiz 	"0110"
n7b:         .asciiz 	"0111"
n8b:         .asciiz 	"1000"
n9b:         .asciiz 	"1001"
n10b:        .asciiz 	"1010"
n11b:        .asciiz 	"1011"
n12b:        .asciiz 	"1100"
n13b:        .asciiz 	"1101"
n14b:        .asciiz 	"1110"
n15b:        .asciiz 	"1111"
#################################
hexin:       .space  	16      # Reserve memory for our input string of numbers
empty:       .asciiz 	" "     # Create string with Space symbol
#################################
    .text			# Entering to process zone of our program
#################################
main:
    li       $v0, 8     	# Call system service Read String
    la       $a0, hexin 	# Read the string
    li       $a1, 16     	# Max length of our string
    syscall
#################################
    li       $t0, 0     	# Create the interator of main cycle
#################################
parse:                  	# Cycle for pursing our input HEX numbers
    add      $t3, $t0, 1        # $t3 = $t0++
    lb       $t2, hexin($t0)    # $t2 = hexin[$t0]
    lb       $t4, hexin($t3)    # $t4 = hexin[$t3]
    beq      $t4, $zero, main  	# Check the end of our entered data
################################# Recognize every entered number
    lb       $t3, n1h           # $t3 = '1'
    beq      $t2, $t3, c1h      # if hexin[$t0] == '1' go to c1h subprog
    lb       $t3, n2h
    beq      $t2, $t3, c2h
    lb       $t3, n3h
    beq      $t2, $t3, c3h
    lb       $t3, n4h
    beq      $t2, $t3, c4h
    lb       $t3, n5h
    beq      $t2, $t3, c5h
    lb       $t3, n6h
    beq      $t2, $t3, c6h
    lb       $t3, n7h
    beq      $t2, $t3, c7h
    lb       $t3, n8h
    beq      $t2, $t3, c8h
    lb       $t3, n9h
    beq      $t2, $t3, c9h
    lb       $t3, n10h
    beq      $t2, $t3, c10h
    lb       $t3, n11h
    beq      $t2, $t3, c11h
    lb       $t3, n12h
    beq      $t2, $t3, c12h
    lb       $t3, n13h
    beq      $t2, $t3, c13h
    lb       $t3, n14h
    beq      $t2, $t3, c14h
    lb       $t3, n15h
    beq      $t2, $t3, c15h 
#################################
printBin: 
    li   $v0, 4   		# Call system service Print String
    syscall
    li   $v0, 4 		# Call system service Print String
    la   $a0, empty		# Print Space symbol between binary numbers
    syscall
    addi  $t0, $t0, 1 		# Increment our interator
    j parse           		# Go to read next number
#################################
again:
    jal      main     		# Go to begining
################################# Put argumets for printing symbol
c0h:				
    la   $a0, n0b		
    jal  printBin
c1h:
    la   $a0, n1b		# Put n1b as argumet to print by our subprog printBin (currently it's 0001)
    jal  printBin		# Go to printBin 
c2h:
    la   $a0, n2b
    jal  printBin
c3h:
    la   $a0, n3b
    jal  printBin
c4h:
    la   $a0, n4b
    jal  printBin
c5h:
    la   $a0, n5b
    jal  printBin
c6h:
    la   $a0, n6b
    jal  printBin
c7h:
    la   $a0, n7b
    jal  printBin
c8h:
    la   $a0, n8b
    jal  printBin
c9h:
    la   $a0, n9b
    jal  printBin
c10h:
    la   $a0, n10b
    jal  printBin
c11h:
    la   $a0, n11b
    jal  printBin
c12h:
    la   $a0, n12b
    jal  printBin
c13h:
    la   $a0, n13b
    jal  printBin
c14h:
    la   $a0, n14b
    jal  printBin
c15h:
    la   $a0, n15b
    jal  printBin
