#include <iostream>
#include <fstream>
#include <string>

int main(int argc, char **argv)
{
	std::fstream theoUt;
	theoUt.open(argv[1], std::ios_base::out);
	theoUt << "";
	theoUt.close();
	theoUt.open(argv[1], std::ios_base::app);
	std::string curResp;
	while(std::getline(std::cin, curResp))
	{
		std::cout << curResp << "\n";
		theoUt << curResp << "\n";
	}
	theoUt.close();
	return 0;
}
