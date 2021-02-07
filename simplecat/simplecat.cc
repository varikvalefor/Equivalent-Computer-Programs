#include <iostream>
#include  <fstream>
int main(int argc, char * * argv)
{
	std::fstream fuck;
	std::string off;
	fuck.open(argv[1], std::ios::in);
	while(std::getline(fuck,off))
		std::cout << off << "\n";
}
