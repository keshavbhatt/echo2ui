#!/bin/bash

n=${1:-2}  # Default to 2 seconds

echo "worker: Will self-destruct in $n seconds..."

sleep $n

echo "worker: Self-destructing..."
kill $$
