#include <gmpxx.h>
#include <iostream>
#include <stdlib.h>
#define G arc4random()

mpz_class calcSign()
{
	if(G % 2 == 1) return 1;
	else           return -1;
}

int main()
{
	gmp_randclass x (gmp_randinit_default);
	while(1)
	{
		x.seed(G*G);
		std::cout << x.get_z_bits(63) * calcSign() << "\n";
	}
}
