.data 
 
	
	Astring: .asciiz "Is  this a        fox which        I see  in front  of      me?    or    a parrot or a cat hmmmmmm      idk"
	space: .asciiz " "
	
.text

	main:
	la $s0, Astring
	la $a3, space
	
	li $t3, 0 #counter start at 0
	li $t4, 0 #space tracker start with 0
	lb $t5, 0($a3) #space char
	
	loop:
	
	        add $s1, $s0, $t3 #load Astring[i], i = $t3
	        lb $a0, 0($s1) #loads the char
	       
		beq $a0, $zero, exit #if $a0 is zero or null then exit because end of string
				 
		addi $t3, $t3, 1 #counter goes up by 1
		
		
		charcheck:
		beq $a0, $t5, spacecheck #check if current character in $a0 is space 
		bne $a0, $t5, printchar #if not space then print character
		 
	
	
		spacecheck:
		beq $t4, 0, printspace #if last character not space, then print space
		j loop #loop again
		
		
		#prints space
		printspace:
		li $a0, ' '
		li $v0, 11    # print_character
		li $t4, 1 #if 1 then last character is space, so spacecheck does not print another space next time it runs into one
		syscall
		j loop #loop again
		
		
		printchar:
		li $v0, 11 #prints to console, 11 is for char
		li $t4, 0 #0 so next time space can be printed
		syscall
		j loop #loop again
		
		
		
 	 #end
	 exit:	 	 	   
         li $v0, 10
         syscall

	
	
	
	 
