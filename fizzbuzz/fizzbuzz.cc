#include <iostream>
#include <gmpxx.h>
#include <string>

std::string run(mpz_class k)
{
	if(k % 15 == 0) return "FIZZ BUZZ";
	if(k % 5 == 0)  return "BUZZ";
	if(k % 3 == 0)  return "FIZZ";
  return k.get_str();
}

int main()
{
	for(mpz_class i = 1; i > 0; i++)
		std::cout << run(i) << "\n";
}
