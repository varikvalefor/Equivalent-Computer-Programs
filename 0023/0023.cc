#include <string>
#include <iostream>
#include <filesystem>

void listThePhiles(char * d)
{
	for(auto f : std::filesystem::directory_iterator(d))
		/* f iterates over std::filesystem::directory_iterator(d), which
		contains a list of the files of directory d. */
		std::cout << f.path().filename().string() << std::endl;
		/* Oh, boy...
		f.path() is the full file path of f.
		f.path() contains the parent directories of f, and these results are
		to be discarded. As such, f.path().filename() returns the
		directory-stripped filename of f; however, f.path.filename() is not a
		string.  Because a string is desired, the string() function of
		f.path().filename() is used to output a string. */
}

int main(int argc, char ** argv)
{
	if(argc > 1)
		for(int k = 1; k < argc; k++)
			listThePhiles(argv[k]);
	else
		listThePhiles("./");
}
