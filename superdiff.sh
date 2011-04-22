#!/bin/bash
# Copyright 2011 Alessandro Novarini
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

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
