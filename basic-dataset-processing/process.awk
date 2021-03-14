{
    arr[$col_id]++
}

END {
    first = 1
    for (i in arr) {
	if (first == 1) {
	    min = arr[i]
	} else {
	    if (arr[i] < min) {
		min = arr[i]
	    }
	}
    }

    for (i in arr) {
	printf(i)
	for (j = 0; j < 10 - length(i); ++j) {
	    printf(" ")
	}
	printf(arr[i])
	for (j = 0; j < 10 - length(arr[i]); ++j) {
	    printf(" ")
	}
	for (k = 0; k < arr[i] / min; ++k) {
	    printf("#")
	}
	print("")
    }
}