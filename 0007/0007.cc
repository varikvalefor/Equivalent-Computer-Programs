#include <iostream>
#include <gmpxx.h>

int main()
{
	mpz_class a, b;
  
	while(true)
	{
		a++;
		for(b = 0;  b < a;  b++)
			std::cout << b;
		std::cout << "\n";
	}
}
