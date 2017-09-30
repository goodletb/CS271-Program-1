TITLE Calculator     (Program01.asm)

; Author: Brad Goodlett
; Course/project IDDate: Program 1
; Description: Calculates the sum, difference, product, (integer) quotient and remainder of the numbers.

INCLUDE Irvine32.inc

	;define constants here


.data

	;numbers the program will get from input or calculations
	firstNumber		dword		?
	secondNumber		dword		?
	resultAdd		dword		?	;this is the result of addition of the two numbers
	resultSub		dword		?	;this is the result of subtraction of the two numbers
	resultMul		dword		?	;this is the result of multiplication of the two numbers
	resultDiv		dword		?	;this is the integer result of division of the two numbers
	resultDiv2		dword		?	;this is the remainder of the result of the division of the two numbers

	;strings the program will display
	intro_1			byte		"Hi, My name is Brad Goodlett", 0
	intro_2			byte		"This program is called Calculator and calculates addition, subtraction,",
							"multiplication, and division of two numbers of your choice", 0
	instructions_1 	byte		"Please put in a number: ", 0
	instructions_2		byte		"Please put in a second number: ", 0
	info_1			byte		"The two numbers added together give: ", 0
	info_2			byte		"The difference of the two numbers is: ", 0
	info_3			byte		"The numbers multiplied together give: ", 0
	info_4			byte		"The result of dividing the numbers is: ", 0
	info_4_2		byte		" with a remainder of: ", 0
	finished		byte		"The program has finished executing and will close...", 0

.code
main PROC

	;display name
	mov edx, offset intro_1
	call writeString
	call CrLf

	;display program title
	mov edx, offset intro_2
	call writeString
	call CrLf

	;tell the user to input the first number and store in a variable
	mov edx, offset instructions_1
	call writeString
	call readInt
	mov firstNumber, eax
	call CrLf

	;tell the user to input the second number and store in a variable
	mov edx, offset instructions_2
	call writeString
	call readInt
	mov secondNumber, eax
	call CrLf

	;calculate sum of the two numbers and store in a variable
	mov eax, firstNumber
	mov ebx, secondNumber
	add eax, ebx
	mov resultAdd, eax

	mov eax, firstNumber
	mov ebx, secondNumber
	cmp eax, ebx
	jle firstSmall
	sub eax, ebx
	mov resultSub, eax
	jmp subtractionEnd
	firstSmall:
	sub ebx, eax
	mov resultSub, ebx
	subtractionEnd:

	;calculate product of the two numbers and store in a variable
	mov eax, firstNumber
	mov ebx, secondNumber
	mul ebx
	mov resultMul, eax

	;calculate quotient and remainder of the numbers and store them in variables
	mov eax, firstNumber
	cdq
	mov ebx, secondNumber
	div ebx
	mov resultDiv,  eax
	mov resultDiv2, edx

	;display the results in the order they were calculated
	;addition
	mov edx, offset info_1
	call writeString
	mov eax, resultAdd
	call writeDec
	call CrLf

	;subtraction
	mov edx, offset info_2
	call writeString
	mov eax, resultSub
	call writeDec
	call CrLf

	;multiplication
	mov edx, offset info_3
	call writeString
	mov eax, resultMul
	call writeDec
	call CrLf

	;division/remainder
	mov edx, offset info_4
	call writeString
	mov eax, resultDiv
	call writeDec
	mov edx, offset info_4_2
	call writeString
	mov eax, resultDiv2
	call writeDec
	call CrLf

	;display a message that the program is finished
	mov edx, offset finished
	call writeString
	call CrLf

	exit; exit to operating system
main ENDP

	;<insert additional procedures here>

END main
