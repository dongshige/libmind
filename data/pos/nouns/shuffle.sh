#****f* shadegrowncode/randomShuffle
# NAME
#   randomShuffle - prints random permutation of lines in standard input
# FUNCTION
#   Prints all or the first N lines of a random permutation of the
#   lines of standard input. The random permutation is obtained using
#   Durstenfeld shuffle algorithm. Performance is O(N) in memory and
#   CPU.  Limit the input to 32768 lines or rewrite using a different
#   random generator.
# SEE ALSO
#   http://en.wikipedia.org/wiki/Knuth_shuffle
# PARAMETERS
#   * 1 - (optional) return only the first N of the random lines of input
# SOURCE
function randomShuffle
{
    typeset -a elements
    typeset length=0
    while read line
    do
        elements[$length]=$line
        length=$(($length + 1))
    done
    typeset firstN=${1:-$length}
    if [ $firstN -gt $length ]
    then
        firstN=$length
    fi
    for ((i=0; $i < $firstN; i++))
    do
        randPos=$(($RANDOM % ($length - $i) ))
        printf "%s\n" "${elements[$randPos]}"
        elements[$randPos]=${elements[$length - $i - 1]}
    done
}
#***
