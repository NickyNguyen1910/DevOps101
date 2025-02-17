#!/bin/bash

#Write a Bash script that prints the contents of a file named “output.txt” when executed.
#The script must find the file across a directories of system

path=$(find / -xdev -type f -name "output.txt" 2>/dev/null)

if [ -z "$path" ]; then

        echo "Khong tim thay file" 
else
        echo "Tim thay file tai: $path"
fi