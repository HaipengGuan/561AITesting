#!/bin/bash

# --------------------------------------------------
# change cmd into your execution command
# cmd="python homework.py"
# cmd="time java homework"
cmd="java homework"

# --------------------------------------------------
# change value table, mode, size, depth limit, init state etc.
cat << EOF > input.txt
5
ALPHABETA
X
6
20 16 1 32 30
20 12 2 11 8
28 48 9 1 1
20 12 10 6 2
25 30 23 21 10
.....
.....
.....
.....
.....
EOF

# ------------- Bash Script --------------------------------
echo "-----Start playing: ------"

N=$(head -1 input.txt)
startLine=$(($N+5))
player=$(sed -n -e 3p input.txt)
opponent='X'
if [[ $player == 'X' ]]; then
	opponent='O'
fi
total=$(($N*$N))
rm total_output.txt
touch total_output.txt
for ((i=0; i<$total; i++)); do
    eval $cmd
    cat output.txt
    echo "-------"
    grep '\.' output.txt > /dev/null
    if [ $? -ne 0 ]; then
        echo FINISH
        exit
    fi
    cat output.txt >> total_output.txt
    echo "-------" >> total_output.txt
    sed -i -e  $startLine',$d' input.txt
    cat output.txt | tail -$N >> input.txt
    sed -i -e '3s/.*/'$opponent'/' input.txt
    tmp=$player
    player=$opponent
    opponent=$tmp
done
