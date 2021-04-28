#include <time.h>
#include <stdio.h>
#include <string.h>

char * msg = "We are the music makers.";

int main()
{
	for(int i = 0; i < strlen(msg); i++)
	{
		printf("%c", msg[i]);
		fflush(stdout);
		nanosleep((const struct timespec []) {0,100000000}, NULL);
	}
	printf("\n");
	main();
}
