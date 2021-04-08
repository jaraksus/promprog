#include "main.h"

#include <iostream>
#include <vector>

int main() {
	int n = 10;

	std::vector<int> a;
	for (int i = 0; i < n; ++i) {
		a.push_back(i);
	}

	std::vector<int> b;
	for (int i = 100; i < 100 + n; ++i) {
		b.push_back(i);
	}

	for (size_t i = 0; i < a.size(); ++i) {
		std::cout << mod_sum(a[i], b[i]) << std::endl;
	}
	return 0;
}