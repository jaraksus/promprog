#!/bin/bash

file=$1

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--stat)
    col_name="$2"
    shift
    shift
    ;;
    *)
    shift
    ;;
esac
done

col_id=$(head -n 1 "$file" | awk -F, -v col="$col_name" -f get_col_id.awk)

cat $file | awk -F'"' -f parse_columns.awk | awk -F, -v col_id="$col_id" -f process.awk