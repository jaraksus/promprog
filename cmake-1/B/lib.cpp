#include "lib.h"

const int MOD = 1e9 + 7;

int mod_sum(int a, int b) {
	return (a + b) % MOD;
}

int mod_mul(int a, int b) {
	long long res = (long long)a * (long long)b;
	if (res >= MOD) {
		res %= MOD;
	}
	return res;
}