BEGIN {id = 0}
{
    if (id != 0) {
        print($1 $3)
    }
    id = id + 1
}