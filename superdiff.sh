#!/bin/bash

usage ()
{
    echo
    echo "Usage: superdiff.sh DIR1 DIR2 FILE_PATTERN"
    echo
    echo "Example: superdiff.sh modeshape modeshape-stone *.java"
    echo
}

if [ 3 -ne $# ]
then
    usage
else
    DIR1=$1
    DIR1_LENGTH=${#DIR1}

    for FILE in $(find $1 -name "$3" -type f)
    do
        RELATIVE_FILE=${FILE:DIR1_LENGTH}
        DIR2_FILE=$2$RELATIVE_FILE
        diff \
            -u \
            --ignore-tab-expansion \
            --ignore-space-change \
            --ignore-blank-lines \
            --new-file \
            $FILE $DIR2_FILE
    done
fi
