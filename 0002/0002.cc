#define penis mpz_t
#include <gmp.h>

bool isPrime(penis n)
{

	penis m,o,p;
	mpz_inits(m,o,p);
	mpz_sqrt(o, n);
	mpz_set_ui(m,1);

	while(mpz_cmp(m,o) <= 0)
	{
		mpz_add_ui(m,m,1);
		mpz_mod(p, n, m);
		if(mpz_cmp_ui(p, 0) == 0)
			return false;
	}

	return true;
}

int main()
{
	penis n;
	mpz_init_set_str(n, "2", 1);
	while(true)
	{
		if(isPrime(n))
			gmp_printf("%Zd\n", n);
		mpz_add_ui(n,n,1);
	}
}
