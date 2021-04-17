import sys

import numpy as np
import matplotlib.pyplot as plt

def pixel_value(c):
	if 0 <= c <= 1:
		return round(c * 255)
	else:
		return c

if __name__ == '__main__':
	map_file = sys.argv[1]
	in_file = sys.argv[2]
	out_file = sys.argv[3]

	tr = np.array(plt.imread(map_file)).transpose([2, 0, 1])
	print(tr.shape)
	inp = np.array(plt.imread(in_file)).transpose([2, 0, 1])

	with open(out_file, 'w') as of:
		of.write('#pragma once\n')
		of.write('#include <vector>\n')
		of.write('using namespace std;\n')
		of.write('vector<vector<vector<unsigned char> > > arr = {\n')
		for ch in range(3):
			of.write('	{\n')

			for i in range(inp.shape[1]):
				line = ', '.join([str(pixel_value(tr[ch][ch][pixel_value(x)])) for x in inp[ch][i]])
				of.write(f'		{{ {line} }}')
				if (i + 1 != inp.shape[1]):
					of.write(',')
				of.write('\n')

			if ch != 2:
				of.write('	},\n')
			else:
				of.write('	}\n')
		of.write(f'}};')
