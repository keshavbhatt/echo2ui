#!/bin/bash

n=${1:-2}  # Default to 2 seconds

echo "worker: Will self-destruct in $n seconds..."

sleep $n

echo -e "worker: Self-destructing..."
echo -e "worker: This is application's output 0\n"
echo -e "worker: This is application's output 1\n"
echo -e "worker: This is application's output 2\n"
echo -e "worker: This is application's output 3\n"
echo -e "worker: This is application's output 4\n"
echo -e "worker: This is application's output 5\n"
echo -e "worker: This is application's output trying to crash...6\n"
echo -e "worker: This is application's output and app is about to crash 7\n"
echo -e "worker: This is application's output before crashing 8\n"
kill $$
