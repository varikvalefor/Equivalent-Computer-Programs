#include <iostream>
#include <time.h>

int main()
{
	std::cout.setf(std::ios::unitbuf);

	for(char j : "We are the music makers.\n")
	{
		std::cout << j;
		nanosleep((const struct timespec []) {0,100000000}, NULL);
	}
	main();
}
