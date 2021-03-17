#!/bin/bash

path=""
train_ratio=0.75
y_column=""
stratified=0

# parsing arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --input)
    path="$2"
    shift
    shift
    ;;
    --train_ratio)
    train_ratio="$2"
    shift
    shift
    ;;
    --y_column)
    y_column="$2"
    shift
    shift
    ;;
    --stratisfied)
    stratisfied=1
    shift
    ;;
    *)
    shift
    ;;
esac
done

# get all lines into array
data=$(tail -n+2 $path)
line_id=1
IFS=$'\n'; for line in $data
do
    lines[$line_id]=$line
    line_id=$(( $line_id + 1 ))
done

# getting target column id
col_id=$(head -n 1 $path | awk -F, -v col="$y_column" -f get_col_id.awk)

# getting train_size
train_size=$(cat $path | awk -F'"' -f parse_columns.awk | \
awk -F, -v stratisfied="$stratisfied" -v train_ratio="$train_ratio" -v col_id="$col_id" -f get_train_size.awk)

# getting indices: train_ids and then test_ids
if [[ $stratisfied -eq 1 ]]
then
    ids=$(cat $path | awk -F'"' -f parse_columns.awk | \
          awk -F, -v col_id="$col_id" -v train_ratio="$train_ratio" -f stratisfied_shuffle.awk)
else
    ids=$(cat $path | awk -F'"' -f parse_columns.awk | \
          awk -f shuffle.awk)
fi

# making headers for train and test data
echo $(head -n 1 $path) > train_data.csv
echo $(head -n 1 $path) > test_data.csv

line_id=1
for id in $ids
do
    if [[ $line_id -le $train_size ]]
    then
        echo ${lines[$id]} >> train_data.csv
    else
        echo ${lines[$id]} >> test_data.csv
    fi

    line_id=$(( $line_id + 1 ))
done
