#include <gmp.h>
#include <stdio.h>
int wmc(mpz_t a, int b)
{
	mpz_t c;
	mpz_mod_ui(c,a,b);
	return !mpz_cmp_ui(c,0);
}

int main()
{
	mpz_t a;
	mpz_init(a);
	while(1)
	{
		mpz_add_ui(a,a,1);

		if(wmc(a,15))     printf("FIZZ BUZZ\n");
		else if(wmc(a,5)) printf("BUZZ\n");
		else if(wmc(a,3)) printf("FIZZ\n");
		else              gmp_printf("%Zd\n", a);
	}
}
