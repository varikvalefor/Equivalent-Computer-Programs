#include <iostream>
#include <gmp.h>
#include <gmpxx.h>

int main(int argc, char ** argv)
{
	for(mpz_class a = 1; a <= mpz_class(argv[1], 10); a++)
		/* mpz_class(argv[1], 10) converts the first argument of
		0023 to a value of type mpz_class; such conversion is a
		prerequisite of comparing this argument and variable a. */
		std::cout << a;
	std::cout << std::endl;
	return(0);
}
