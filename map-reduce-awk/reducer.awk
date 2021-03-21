{
	cnt[$1]++
}

END{
	for (i in cnt) {
		print i "\t" cnt[i]
	}
}