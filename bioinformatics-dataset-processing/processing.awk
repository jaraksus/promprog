function get_quality(q) {
	qualities = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
	for (j = 1; j <= length(qualities); ++j) {
		if (q == substr(qualities, j, 1)) {
			return j
		}
	}
	return -1
}

BEGIN {
	min_q = get_quality(min_quality)
	line_id = 0
}

{
	seq[line_id % 4] = $0

	if (line_id % 4 == 3) {
		residual_sz = 0

		new_seq = ""
		new_q   = ""

		for (i = 1; i <= length(seq[3]); ++i) {
			q = get_quality(substr(seq[3], i, 1))
			if (q >= min_q) {
				residual_sz++
				new_seq = sprintf("%s%s", new_seq, substr(seq[1], i, 1))
				new_q   = sprintf("%s%s", new_q,   substr(seq[3], i, 1))
			}
		}

		if (length(dest) > 0) {
			split(seq[0], splitted, " ")
			print splitted[1] " " splitted[2] " " sprintf("length=%d", residual_sz) >> dest
			print new_seq >> dest
			split(seq[2], splitted, " ")
			print splitted[1] " " splitted[2] " " sprintf("length=%d", residual_sz) >> dest
			print new_q >> dest
		} else {
			split(seq[0], splitted, " ")
			print splitted[1] " " splitted[2] " " sprintf("length=%d", residual_sz)
			print new_seq
			split(seq[2], splitted, " ")
			print splitted[1] " " splitted[2] " " sprintf("length=%d", residual_sz)
			print new_q
		}
	}

	line_id++
}
