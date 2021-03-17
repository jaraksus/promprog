BEGIN {
    srand()
    global_id = 0
}

{
    global_id++
    ids[$col_id]++
    arr[$col_id, ids[$col_id]] = global_id
}

END {
    for (col_value in ids) {
        for (i = 1; i <= ids[col_value]; ++i) {
            rnd_index = 1 + int(rand() * ids[col_value])
            if (rnd_index > ids[col_value]) {
                rnd_index = ids[col_value]
            }

            tmp = arr[col_value, rnd_index]
            arr[col_value, rnd_index] = arr[col_value, i]
            arr[col_value, i] = tmp
        }
    }

    # writing train part indices
    for (col_value in ids) {
        train_size = int(train_ratio * ids[col_value])
        for (i = 1; i <= train_size; ++i) {
            print(arr[col_value, i])
        }
    }

    # writing test part indices
    for (col_value in ids) {
        train_size = int(train_ratio * ids[col_value])
        for (i = train_size + 1; i <= ids[col_value]; ++i) {
            print(arr[col_value, i])
        }
    }
}