#include <gmp.h>

/* faq(a, b) writes the factorial of b to a. */
void faq(mpz_t result, mpz_t k)
{
	/* x is the iterator which is repeatedly multiplied by result. */
	mpz_t x;
	mpz_set_ui(x, 1);
	/* The following line is roughly equivalent to
	 * "for(int result = 1; x < k; k++)". */
	for(mpz_init_set_ui(result, 1); mpz_cmp(x, k) <= 0; mpz_add_ui(x,x,1))
		/* The product of result and x is assigned to result. */
		mpz_mul(result, result, x);
	/* When the "for" loop ends, "result" is already defined as being the
	 * factorial -- no further commands are necessary.  So ends this
	 * comment. */
}

int main()
{
	mpz_t a, currentFactorialResult, l;
	mpz_init(currentFactorialResult);
	/* The following line is roughly equivalent to "for(int a = 0 ;; a++)".
	For all natural numbers a, bracketed bit is "done" on a. */
	for(mpz_init_set_ui(a, 0) ;; mpz_add_ui(a, a, 1))
	{
		/* The factorial of a is assigned to currentFactorialResult. */
		faq(currentFactorialResult, a);
		/* currentFactorialResult is output to the terminal. */
		gmp_printf("%Zd\n", currentFactorialResult);
	}
}
