{
	for (i = 1; i <= NF; ++i) {
		word = $i

		gsub(",", "", word)
		gsub("\.", "", word)
		gsub(":", "", word)
		gsub(";", "", word)
		gsub("\?", "", word)

		print word "\t" 1
	}
}