#!/bin/bash

file1=$1
file2=$2

# Check if files exist
if [[ ! -f "$file1" || ! -f "$file2" ]]; then
  echo " One or both files do not exist!"
  exit 1
fi

# Compare files
if cmp -s "$file1" "$file2"; then
    echo " Files are identical."
else
    echo " Files are different."

    # Sort files temporarily to use 'comm'
    tmp1=$(mktemp)
    tmp2=$(mktemp)

    sort "$file1" > "$tmp1"
    sort "$file2" > "$tmp2"

    echo -e "\n Unique lines in $file1:"
    comm -23 "$tmp1" "$tmp2"

    echo -e "\n Unique lines in $file2:"
    comm -13 "$tmp1" "$tmp2"

    # Clean up
    rm "$tmp1" "$tmp2"
fi

