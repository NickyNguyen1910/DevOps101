#!/bin/bash

# Write a Bash script that converts all text in a file named "temp.txt" to uppercase.

if [ ! -f temp.txt ]; then
    echo "Khong co file temp.txt!"
    exit 1
fi

tr '[:lower:]' '[:upper:]' < temp.txt > temp_upper.txt

echo "Noi dung moi da them vao temp_upper.txt."



# Write a Bash script that removes empty lines from a text file named "file.txt".

if [ ! -f file.txt ]; then
    echo "Khong tim thay file.txt!"
    exit 1
fi

sed '/^$/d' file.txt > file_new.txt

echo "Da loai bo cac dong trong file file.txt."


# Write a Bash script that list all the process and process and output a file that contains only PID.

if [ ! -f pid_list.txt ]; then
    touch pid_list.txt
fi

ps -e -o pid > pid_list.txt

echo "Da liet ke vao file pid_list.txt"


# Write a Bash script that trims leading and trailing whitespace from each line in a text file named "data.txt".

sed 's/^[[:space:]]*//;s/[[:space:]]*$//' data.txt > trimmed_data.txt
echo "done"

