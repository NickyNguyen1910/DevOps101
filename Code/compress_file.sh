#!/bin/bash

#Write a Bash script that compresses a directory named "workarea" into a zip archive named "archive.zip" with password protection.

dir="workarea"

zip_dir="workarea.zip"

if [ -d "$dir" ]; then
  zip -r -e "$zip_dir" "$dir" #se yeu cau mat khau
  echo "Thu muc $dir da duoc nen thanh $zip_dir ."
else
  echo "Thu muc $dir khong ton tai."
fi