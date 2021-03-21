BEGIN{
	for (n = 0; n < 256; n++) {
		ord[sprintf("%c",n)] = n
	}

	MOD = 909091
	p = 239
}

function get_hash(a) {
	h = 0
	for (i = 1; i <= length(a); ++i) {
		h = (h * p + ord[substr(a, i, i)]) % MOD
	}
	return h
}

{
	print $0 >> sprintf("red_%d.txt", get_hash($1) % n_red + 1)
}