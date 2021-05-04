#include <iostream>
#include <gmpxx.h>

int main()
{
	for(mpz_class a = 1;;a++)
	{
		for(mpz_class b = 0; b <= a; b++)
			std::cout << b;
		std::cout << std::endl;
	}
}
