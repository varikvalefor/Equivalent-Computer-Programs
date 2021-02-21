#include <iostream>
#include <gmpxx.h>

bool isPrime(mpz_class n)
{
	mpz_class m,o,p;
	for(m = 2; m < sqrt(n); m++)
		if(n % m == 0)
			return false;
	return true;
}

int main()
{
	for(mpz_class n = 2 ;; n++)
		if(isPrime(n))
			std::cout << n << "\n";
}
