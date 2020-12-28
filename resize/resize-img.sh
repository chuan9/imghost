#!/bin/bash

# List all the formats you wish to have
SIZES="1024x768"

# pass directory as first argument to the script
# Use '.' (current directory) if no argument was passed
DIR=${1:-.}

find $DIR -type f | while read file; do
   for size in $SIZES; do
      # Resize and rename DSC01258.JPG into DSC01258_640x480.JPG, etc.
      # Remove the ! after $size if you do not wish to force the format
      #convert -resize "${size}!" "$file" "${file%.*}_${size}.${file##*.}"
      convert -resize "${size}!" "$file" "${file%.*}.${file##*.}"
   done
done