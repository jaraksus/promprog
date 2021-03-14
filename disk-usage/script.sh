#!/bin/bash

total=0

walk () {
    ls_res=$(ls -la $1)
    id=0
    IFS=$'\n'; for line in $ls_res
    do
	if [[ $id -gt 2 ]] # skipping 3 first lines
	then
	    sz=$(echo $line | awk '{print $5}')
	    total=$(( $total + $sz ))

	    filename=$(echo $line | awk '{print $9}')
	    if [[ -d "$1/$filename" ]]
	    then
		walk "$1/$filename"
	    fi
	fi
	id=$(( $id + 1 ))
    done
}

walk .

units=("T" "G" "M" "K" "")
id=0
power=$(( 1024 * 1024 * 1024 * 1024 ))
while ! [[ $total -ge $power ]]
do
    power=$(( power / 1024 ))
    id=$(( id + 1 ))
done

echo "$(echo "scale=2; $total / $power" | bc -l)${units[$id]}"