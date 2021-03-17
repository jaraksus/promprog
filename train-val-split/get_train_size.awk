BEGIN {
    global_id=0
}

{
    global_id++
    if (stratisfied == 1) {
        ids[$col_id]++
    }
}

END {
    if (stratisfied == 1) {
        train_size = 0
        for (col_value in ids) {
            train_size += int(train_ratio * ids[col_value])
        }
    } else {
        train_size = int(train_ratio * global_id)
    }

    print train_size
}