#!/bin/bash

n_workers=1
file="labelled_newscatcher_dataset.csv"
col=""
path="./"

while [[ $# -gt 0 ]]
do

key=$1
case $key in
	-w|--workers)
	n_workers=$2
	shift
	shift
	;;
	-f|--file)
	file=$2
	shift
	shift
	;;
	-c|--column)
	col=$2
	shift
	shift
	;;
	-p|--path)
	path=$2
	shift
	shift
	;;
	*)
	shift
	;;
esac
done

if [[ ! -d $path ]]
then
	echo "incorrect directory"
	exit 1
fi

if [[ ! -f $file ]]
then
	echo "incorrect filename"
	exit 1
fi

cat $file | awk -F';' -v col="$col" -f parse_links.awk | parallel -j "$n_workers" wget -P "$path" {}
