#include <stdio.h>
#include <gmp.h>

int main()
{
	mpz_t a, b;
	mpz_init_set_ui(a, 0);
	mpz_init(b);

	while(1)
	{
		mpz_add_ui(a, a, 1);
		for(mpz_set_ui(b, 1);  mpz_cmp(b, a) < 0;  mpz_add_ui(b, b, 1))
			gmp_printf("%Zd", b);
		printf("\n");
	}
}
