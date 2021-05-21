#include <gmpxx.h>
#include <iostream>

mpz_class dumbSum(mpz_class k)
{
	/* For all $n \in \mathbb N$,
	 * \[\texttt{dumbSum}(n) = \sum_{x=1}^n x.\] */

	mpz_class tot;
	for(mpz_class i = 1; i <= k; i++)
		tot += i;
	/* The above for loop iterates over all natural numbers between 1 and
	 * k, adding each number to the total tot. */
	return tot;
	/* The total is returned. */
}

mpz_class clevSum(mpz_class k)
{
	return k * (k + 1) / 2;
	/* For all $n \in \mathbb N$,
	 * \[\sum_{x=1}^n x = \frac{n \cdot (n + 1)}{2}.\] */
}

void tp(mpz_class k)
{
	#define ds dumbSum(k)
	#define cs clevSum(k)
	#define sx "\\sum_{x=1}^{" << k << "} = "
	/* The "#define" statements are used because C++ lacks a "where"
	 * clause functionality.  A relatively useful explanation is a*/
	/* Theorem.  The "#define" statements are present.
	 * Proof.
	 * There does not exist a line within this file such that the length
	 * of this line exceeds seventy-two (72) characters.
	 * The "#define" statements are not present only if there exists a
	 * line within this file such that the length of this file exceeds
	 * seventy-two (72) characters.
	 * Therefore, the "#define" statements are present.  Q.E.D., yo! */
	std::cout << sx << ds << " = " << cs << "." << std::endl;
	/* sx, ds, " = ", cs, ".", and a newline character are concatenated
	 * and printed to the console.
	 * std::cout automatically "converts" non-string values to strings
	 * before outputting such values. */
	#undef ds
	#undef cs
	#undef sx
	/* ds, cs, and sx are undefined because these definitions are only
	 * used within this scope. */
}

int main()
{
	for(mpz_class i = 1; i <= 6000; i++)
		tp(i);
	/* For all $n \in \left\{n\in \mathbb N : 1 \leq n \leq 6000\right\}$,
	 * function \texttt{tp} is applied to n. */
}
