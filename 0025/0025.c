#include <gmp.h>

/* faq(a, b) writes the factorial of b to a. */
void faq(mpz_t result, mpz_t k)
{
	mpz_t x;
	mpz_set_ui(x, 1);
	for(mpz_init_set_ui(result, 1); mpz_cmp(x, k) <= 0; mpz_add_ui(x,x,1))
		/* The above line is roughly equivalent to
		 * "for(int result = 1; x < k; k++)". */
		mpz_mul(result, result, x);
		/* The product of result and x is assigned to result. */
	/* When the "for" loop ends, "result" is already defined as being the
	 * factorial -- no further commands are necessary.  So ends this
	 * comment. */
}

int main()
{
	mpz_t a, currentFactorialResult, l;
	mpz_init(currentFactorialResult);
	for(mpz_init_set_ui(a, 0) ;; mpz_add_ui(a, a, 1))
	/* The above line is roughly equivalent to "for(int a = 0 ;; a++)".
	For all natural numbers a, bracketed bit is "done" on a. */
	{
		faq(currentFactorialResult, a);
		/* The factorial of a is assigned to currentFactorialResult. */
		gmp_printf("%Zd\n", currentFactorialResult);
		/* currentFactorialResult is output to the terminal. */
	}
}
