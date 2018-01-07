//  Assembly Language Project
#include <stdio.h>

int main() {
	int i;
	int j;
	int k;
	/*
	The two variables below were used in checking the correctness of the program.
	int correctChecking;
	int index;
	*/

    // Initialize the array to hold all of the values. Values held range
    // from 0 to 10,000.
    int sieve[10001];

    // Set all values equal to 1.
	i = 0;
    while (i < 10001){
        sieve[i] = 1;
		i += 1;
    }
    // Find all the prime numbers.
    // sieve[0] represents 0.
    // Start from sieve[2], which represents the first prime number, 2.
	j = 2;
	while (j < 101){
        if (sieve[j] == 1){
			k = j * 2;
			while (k < 10001){
                sieve[k] = 0;
				k += j;
            }
        }
		j += 1;
    }
	/*
	The below functions were used to check the correctness of the program.
    // Print all of the prime numbers, starting from 2.
	correctChecking = 0;
	index = 2;
	while (index < 10001){
        if (sieve[index] == 1){
            printf("\t %d \n", index);
            correctChecking += 1;
        }
		index += 1;
    }
    printf("\t %d \n", correctChecking);
	*/

    return 0;
}