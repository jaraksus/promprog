#!/bin/bash

n_reducers=1
path=""

# parsing arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	path="$2"
	shift
	shift
	;;
    -r|--reducers)
    n_reducers="$2"
    shift
    shift
    ;;
    *)
    shift
    ;;
esac
done

touch reduce_task.txt
i=1
while [[ $i -le $n_reducers ]]
do
	echo "red_$i.txt" >> reduce_task.txt
	touch "red_$i.txt"

	i=$(( $i + 1 ))
done

cat $path | awk -f mapper.awk | awk -v n_red="$n_reducers" -f shuffler.awk
cat reduce_task.txt | parallel -j "$n_reducers" cat {} | awk -f reducer.awk

# clean workspace
rm reduce_task.txt
i=1
while [[ $i -le $n_reducers ]]
do
	rm "red_$i.txt"

	i=$(( $i + 1 ))
done

