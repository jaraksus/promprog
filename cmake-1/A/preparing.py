import sys

f = open('index.h', 'w')
f.write(
'''
#pragma once
#include <vector>

int getId(char c) {
	return (int)(c - 'a');
}
'''
)