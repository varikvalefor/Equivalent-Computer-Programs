#include <iostream>
#include <gmp.h>
#include <gmpxx.h>

int main(int argc, char ** argv)
{
	for(mpz_class a = 1; a <= mpz_class(argv[1], 10); a++)
		std::cout << a;
	std::cout << std::endl;
	return(0);
}
