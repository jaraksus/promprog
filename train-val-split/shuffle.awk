BEGIN {
    srand()
    global_id = 0
}

{
    global_id++
    ids[global_id] = global_id
}

END {
    for (i = 1; i <= global_id; ++i) {
        rnd_index = 1 + int(rand() * global_id)
        if (rnd_index > global_id) {
            rnd_index = global_id
        }

        tmp = ids[rnd_index]
        ids[rnd_index] = ids[i]
        ids[i] = tmp
    }

    for (i = 1; i <= global_id; ++i) {
        print ids[i]
    }
}