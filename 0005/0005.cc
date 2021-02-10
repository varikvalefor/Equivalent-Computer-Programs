#include <iostream>
#include <sstream>
#include <gmpxx.h>

int main(int argc, char * * argv)
{
	mpz_class a, b;
	a = argv[1];
	std::ostringstream c("");

	for(b = 1; b <= a; b++)
		c << b;
	std::cout << c.str() << "\n";

	return 0;
}
