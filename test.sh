#!/bin/bash
assert() {
    expected="$1"
    input="$2"

    ./main "$input" > tmp.s
    gcc -o tmp tmp.s
    ./tmp
    actual="$?"

    if  [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $actual expected, but got $actual"
        exit 1
    fi
}

assert 0 0
assert 42 42

echo OK