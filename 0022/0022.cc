#include <iostream>
#include <time.h>

int main()
{
	/* This thing disables buffering, permitting the writing of individual
	   characters to the standard output. */
	std::cout.setf(std::ios::unitbuf);

	/* For all characters in the string... */
	for(char j : "We are the music makers.\n")
	{
	  /* The current character is written to the standard output. */
		std::cout << j;
		/* The program sleeps for 0.1 seconds before repeating the loop. */
		nanosleep((const struct timespec []) {0,100000000}, NULL);
	}
	main();
}
