#define penis mpz_t
#include <gmp.h>

int isPrime(penis n)
{

	penis m;
	penis o;
	penis p;
	mpz_init(m);
	mpz_init(o);
	mpz_init(p);
	mpz_sqrt(o, n);
	mpz_set_ui(m,2);
	while(mpz_cmp(m,o) <= 0)
	{
		mpz_mod(p, n, m);
		if(mpz_cmp_ui(p, 0) == 0)
			return 0;
		mpz_add_ui(m,m,1);
	}
	return 1;
}

int main()
{
	penis n;
	mpz_init(n);
	mpz_set_ui(n, 2);
	while(1)
	{
		if(isPrime(n))
			gmp_printf("%Zd\n", n);
		mpz_add_ui(n,n,1);
	}
}
