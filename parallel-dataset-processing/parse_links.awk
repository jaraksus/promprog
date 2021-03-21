BEGIN {
	id = 0
}

{
	if (id == 0) {
		for (i = 1; i <= NF; ++i) {
			if (tolower($i) == tolower(col)) {
				col_id = i
				break
			}
		}
	} else {
		print $col_id
	}

	id++
}