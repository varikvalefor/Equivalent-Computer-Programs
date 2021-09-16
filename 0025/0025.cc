#include <gmpxx.h>
#include <iostream>

/* 1 */
mpz_class faktorial(mpz_class g)
{
	if(g > 1) return g * faktorial(g - 1);
	else      return g;
	/* The author elects to use recursion instead of a "for" loop; the
	 * author finds that the conciseness of the resulting recursion is
	 * greater than the conciseness of the alternative to the resulting
	 * recursion. */
}

int main()
{
	for(mpz_class a = 1 ;; a++)
		/* For all natural numbers a, std::cout outputs faktorial(a), i.e.,
		 * the factorial of natural number a. */
		std::cout << faktorial(a) << std::endl;
}
