#!/bin/bash

path=$(find / -xdev -type f -name "output.txt" 2>/dev/null)

if [ -z "$path" ]; then

        echo "Khong tim thay file"
else
        echo "Tim thay file tai: $path"
fi