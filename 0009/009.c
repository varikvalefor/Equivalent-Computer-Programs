#include <stdio.h>

int main()
{
	return fprintf(stderr, "Good-bye, world.\n") < 1;
}
