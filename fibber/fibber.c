#define penis mpz_t
#include <gmp.h>
#include <limits.h>
int main()
{
	penis c;
	penis b;
	penis d;
	mpz_init(c);
	mpz_init(b);
	mpz_init(d);
	mpz_set_ui(b, 1);
	mpz_set_ui(d, 0);
	while(true)
	{
		mpz_add(c,b,d);
		gmp_printf("%Zd\n", c);
		mpz_set(b,d);
		mpz_set(d,c);
	}
	return 0;
}

