#include <iostream>
#include <gmpxx.h>

bool isPrime(mpz_class n)
{
	mpz_class m,o,p;
	o = sqrt(n);
	for(m = 2; m < o; m++)
	{
		if(n % m == 0)
			return false;
	}
	return true;
}

int main()
{
	for(mpz_class n = 2; n > 0; n++)
		if(isPrime(n))
			std::cout << n << "\n";
}
