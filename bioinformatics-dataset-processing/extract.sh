#!/bin/bash

arch=""
file=""
min_quality="!"
seq=-1
dest=""

# parsing arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -a|--arch)
    arch="$2"
    shift
    shift
    ;;
    -f|--file)
    file="$2"
    shift
    shift
    ;;
    -s|--seq)
    seq="$2"
    shift
    shift
    ;;
    -q|--quality)
    min_quality="$2"
    shift
    shift
    ;;
    -d|--destination)
    dest="$2"
    shift
    shift
    ;;
    *)
    shift
    ;;
esac
done

if [[ $seq -eq -1 ]]
then
	if [[ $arch != "" ]]
	then
		tar -axf $arch $file -O | awk -v min_quality="$min_quality" -v dest="$dest" -f processing.awk
	else
		cat $file | awk -v min_quality="$min_quality" -v dest="$dest" -f processing.awk
	fi
else
	if [[ $arch != "" ]]
	then
		tar -axf $arch $file -O | head -n $(( $seq * 4 )) | awk -v min_quality="$min_quality" -v dest="$dest" -f processing.awk
	else
		head -n $(( $seq * 4 )) $file | awk -v min_quality="$min_quality" -v dest="$dest" -f processing.awk
	fi
fi
