#!/bin/bash

file="annotations/instances_train2014.json"
dst="selected.json"
category_id=0
size_bound=0
min_cat=0

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -f|--file)
    file=$2
    shift
    shift
    ;;
    -c|--category_id)
    category_id=$2
    shift
    shift
    ;;
    -d|--destination)
    dst=$2
    shift
    shift
    ;;
    -s|--size_bound)
    size_bound=$2
    shift
    shift
    ;;
    --min_cat)
    min_cat=$2
    shift
    shift
    ;;
    *)
    shift
    ;;
esac
done

iter=0
it=0
img_id=0
for key in $(cat $file | jq --argjson size_bound $size_bound -r '.images[] | select (.width >= $size_bound or .height >= $size_bound) 
    | [.id, .license, .coco_url, .flickr_url, .width, .height, .file_name, .date_captured] | join(" ")')
do
    if [[ $it -eq 0 ]]
    then
        img_id=$key
    elif [[ $it -eq 1 ]]
    then
        img_license[$img_id]=$key
    elif [[ $it -eq 2 ]]
    then
        img_coco_url[$img_id]=$key
    elif [[ $it -eq 3 ]]
    then
        img_flickr_url[$img_id]=$key
    elif [[ $it -eq 4 ]]
    then
        img_width[$img_id]=$key
    elif [[ $it -eq 5 ]]
    then
        img_height[$img_id]=$key
    elif [[ $it -eq 6 ]]
    then
        img_file_name[$img_id]=$key
    elif [[ $it -eq 7 ]]
    then
        img_date_captured[$img_id]=$key
    elif [[ $it -eq 8 ]]
    then
        img_date_captured[$img_id]="${img_date_captured[$img_id]} $key"
    fi

    it=$(( $it + 1 ))

    if [[ $it -eq 9 ]]
    then
        it=0
    fi
done

selected_ids=$(cat $file | jq --argjson category_id "$category_id" '.annotations[] | 
                                                     select (.category_id == $category_id) | .image_id' | \
               awk -v min_cat="$min_cat" '{seen[$0]++}; END{ for(i in seen) if (seen[i] >= min_cat) print i }')

echo -n "id, license, coco_url, flickr_url, width, height, file_name, date_captured" > selected.csv
it=0
for x in $selected_ids
do
    if [[ ${img_license[$x]+abc} ]]
    then
        echo "" >> selected.csv
        echo -n "$x, ${img_license[$x]}, ${img_coco_url[$x]}, ${img_flickr_url[$x]}, \
${img_width[$x]}, ${img_height[$x]}, ${img_file_name[$x]}, ${img_date_captured[$x]}" >> selected.csv
    fi
done

jq --slurp -r -R \
    'split("\n") | .[1:] | map(split(", ")) |
        map({"id": .[0],
             "license": .[1],
             "coco_url": .[2],
             "flickr_url": .[3],
             "width": .[4],
             "height": .[5],
             "file_name": .[6],
             "date_captured": .[7],
        })' \
selected.csv > $dst

echo "json formed"

rm selected.csv