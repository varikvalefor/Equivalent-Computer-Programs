#include <iostream>
#include <sstream>
#include <gmpxx.h>

int main(int argc, char * * argv)
{
	mpz_class a, b;
	a = argv[1];
	std::ostringstream c("");

	for(b = 1; b <= a; b++)
	/* b is appended to c. */
		c << b;
	/* The string which c contains is written to the standard output. */
	std::cout << c.str() << "\n";

	return 0;
}
