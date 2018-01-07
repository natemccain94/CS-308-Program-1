// Programming Project One
// Nate McCain
// sieve_test.c
// Driver Program

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
	// Declare all of the variables for the driver.
	clock_t cStart;
	clock_t cEnd;
	clock_t asmStart;
	clock_t asmEnd;
	int totalTime;
	// Run the c version of the sieve.
	cStart = clock();
	system("sieveC.exe"); // Change to the name of the C-executable.
	cEnd = clock();

	// Run the asm version of the sieve.
	asmStart = clock();
	system("sieveAssembly.exe");	// Change the name of the ASM-executable.
	asmEnd = clock();

	// Output the total time of the C-version
	totalTime = cEnd - cStart;
	printf("\t The total time of the C-version was: %d\n",totalTime);

	// Output the total time of the ASM-version
	totalTime = asmEnd - asmStart;
	printf("\t The total time of the ASM-version was: %d\n",totalTime);

	system("pause");	// This allows the person running the executable to see the output of the application.

	return 0;
}