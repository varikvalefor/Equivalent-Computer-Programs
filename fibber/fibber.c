#define penis unsigned long long //Twice the size of long long!
#include <stdio.h>
int main()
{
	penis c = 0;
	penis b[2] = {0,1};
	while(b[0] + b[1] < 12200160415121876738)
	{
		c = b[0] + b[1];
		printf("%llu\n",c);
		b[0] = b[1];
		b[1] = c;
	}
	return 0;
}
