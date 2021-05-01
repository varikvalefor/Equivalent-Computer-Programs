#include <string>
#include <iostream>
#include <filesystem>

void listThePhiles(char * d)
{
	for(auto f : std::filesystem::directory_iterator(d))
		std::cout << f.path().filename().string() << std::endl;
}

int main(int argc, char ** argv)
{
	if(argc > 1)
		for(int k = 1; k < argc; k++)
			listThePhiles(argv[k]);
	else
		listThePhiles("./");
}
