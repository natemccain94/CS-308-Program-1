; Assembly Language Programming Assignment 1
; Nate McCain

.586
.MODEL FLAT		; Use a flat memory model
.STACK 1000000	; Reserve 1-MB of memory on the stack

.DATA
sieve BYTE 10001 DUP(1)	; Initialize an array representing values from 1 to 10000, each equal to one.

.CODE
main PROC

		lea ebx, sieve;	Load address of the first element of sieve to ebx.
		mov ecx, 0; ecx is the index array.
		mov BYTE PTR [ebx + ecx], 0; Zero is not a prime number.
		inc ecx; Increment ecx.
		mov BYTE PTR [ebx + ecx], 0; One is not a prime number.
		mov ecx, 2; j = 2. This is the index of the array, which starts at the first prime number.
		jmp outerWhileLoop; Branch to the outerWhileLoop to find all of the prime numbers.

;****************************************************************************************************
outerWhileLoop:
	cmp ecx, 101; if ecx >= 101, exit the outerWhileLoop function
	jae endProgramSetup; Go to the function that ends the program.

	; if ecx < 101, then do the following:
	mov edx, ecx
	add edx, ecx; edx is now the first multiple of the current index.

	cmp BYTE PTR [ebx + ecx], 1; if sieve[ecx] == 1, branch to the innerWhileLoop function.
	je innerWhileLoop
	jmp outerWhileLoopHelper; Otherwise, increment ecx and move our indices.
;****************************************************************************************************
innerWhileLoop:
	cmp edx, 10001; if we have reached the end of the index, increment ecx and move our indices.
	jae outerWhileLoopHelper

	; Otherwise
	mov BYTE PTR [ebx + edx], 0; set the current index of sieve to 0 because it is not a prime.
	add edx, ecx; increment edx to the next multiple of ecx.
	jmp innerWhileLoop; return to the beginning of this loop.
;****************************************************************************************************
outerWhileLoopHelper:
	inc ecx; increment the counter for outerWhileLoop
	jmp outerWhileLoop; Go to the beginning of the outerWhileLoop.
;****************************************************************************************************
; Count the number of prime numbers produced.
endProgramSetup:
	mov ecx, 2; ecx will hold the displacement
	mov edx, 0; edx will hold the prime number count
	jmp countPrimes

;****************************************************************************************************
countPrimes:
	cmp ecx, 10001	; End of the array
	jae realEndProgram

	cmp BYTE PTR [ebx + ecx], 1
	je tallyPrimes

	add ecx, 1
	jmp countPrimes
;****************************************************************************************************
tallyPrimes:
	add edx, 1
	add ecx, 1
	jmp countPrimes
;****************************************************************************************************
realEndProgram:
	mov eax, 0
	ret
main ENDP
END