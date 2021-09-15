#include <gmp.h>
#include <stdio.h>

int main(int argc, char * * argv)
{
	mpz_t a,b;
	mpz_inits(a,b);
	mpz_set_str(a,argv[1],10);

	/* The following line is roughly equivalent to
	"for(b = 1; b < a; b++)".  However, C's GMP does not support
	the ++ operator; as such, the use of GMP-specific functions is
	required for proper operation. */
	for(mpz_set_ui(b,1); mpz_cmp(a,b) >= 0; mpz_add_ui(b,b,1))
		gmp_printf("%Zd", b);
	printf("\n");

	return 0;
}
