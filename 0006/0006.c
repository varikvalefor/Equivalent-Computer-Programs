#define ll long long
#define ull unsigned long long

#include <stdio.h>
#include <stdlib.h>

int main()
{
	while(1)
		printf("%lli\n", (ull)arc4random() * (ll)arc4random());
		/*By multiplying two (2) thirty-two-bit calls to arc4random,
		a sixty-four-bit number is produced.*/
}
