{
    for (i = 1; i <= NF; ++i) {
        if (tolower($i) == tolower(col)) {
	    print(i)
	    break
        }
    }
}