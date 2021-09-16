#include <time.h>
#include <stdio.h>
#include <string.h>

/* msg is the message which should be repeatedly written to the standard
   output. */
char * msg = "We are the music makers.\n";

int main()
{
	/* For all characters in msg... */
	for(int i = 0; i < strlen(msg); i++)
	{
		/* The current character is written to the standard output. */
		printf("%c", msg[i]);
		/* The standard output is flushed, ensuring that the character is
		   actually written to the standard output. */
		fflush(stdout);
		/* The program sleeps for 0.1 seconds. */
		nanosleep((const struct timespec []) {0,100000000}, NULL);
	}
	/* The program repeats. */
	main();
}
