#include <iostream>
#include <algorithm>

int main()
{
	std::string k;
	std::cin >> k;
	reverse(k.begin(), k.end());
	std::cout << k << "\n";
  return 0;
}
