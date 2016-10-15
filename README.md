# 561AITesting

## What is it

It's just a bash script allow your AI play game against itself turn by turn, and record all result.

## How to use

You can change `cmd` variable into your execution command, such as:

* `cmd="time java homework"`
* `cmd="python honework.py"`

You can also print more information inside your program, it's up to you.

You can also change size, player, depth limit, value table and initial state after line: `cat << EOF > input.txt`

All output will be added in `total_output.txt`.

## Why

Instead of generating random test cases, we can actually generate `n*n` test case results base on a single `n*n` value table.
