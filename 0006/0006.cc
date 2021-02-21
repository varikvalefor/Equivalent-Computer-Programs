#include <gmpxx.h>
#include <iostream>
#include <stdlib.h>

int main()
{
	gmp_randclass x (gmp_randinit_default);
	while(1)
	{
		x.seed(arc4random() * arc4random());
		std::cout << x.get_z_bits(4096) << "\n";
	}
}
