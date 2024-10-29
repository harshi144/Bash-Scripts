#!/bin/bash

# Directory containing your BED files
directory="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/bed_files"

# Output file to store the results
output_file="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/sample_id.txt"

# Clear the output file if it already exists
> "$output_file"

# Change to the directory containing your BED files
cd "$directory" || exit

# Process each BED file
for file in *.bed; do
    while IFS=$'\t' read -r chr start end rest; do
        id="${chr}_${start}_${end}"
        echo -e "${id}\t${file}" >> "$output_file"
    done < "$file"
done

echo "ID and filenames have been extracted and stored in $output_file"
