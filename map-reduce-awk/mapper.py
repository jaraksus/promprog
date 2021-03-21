#!/bin/python3

import sys

for line in sys.stdin:
    line = line.strip()
    words = line.split()
    for word in words:
        word = word.strip(',.:')
        print('%s\t%s' % (word, 1))