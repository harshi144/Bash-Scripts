#!/bin/bash

# Directory containing all the input text files
input_directory="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/output_annovar"

# Directory to store all output files
output_directory="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/output_finalanno"

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Check if the input directory exists and is accessible
if [ ! -d "$input_directory" ]; then
    echo "Input directory $input_directory does not exist or is not accessible."
    exit 1
fi

# Check if there are any .txt files in the input directory
if compgen -G "$input_directory/*.txt" > /dev/null; then
    echo "Found .txt files in $input_directory. Processing..."
else
    echo "No .txt files found in $input_directory."
    exit 1
fi

# Process each text file in the input directory
for file in "$input_directory"/*.txt; do
    # Print the current file being processed for debugging
    echo "Processing file: $file"
    
    # Extract the base name of the file (without directory and extension)
    base_name=$(basename "$file" .txt)
    
    # Define the output file name in the output directory
    output_file="${output_directory}/${base_name}_processed.txt"
    
    # Print the output file name for debugging
    echo "Output file will be: $output_file"
    
    # Use awk to process the file and handle any errors
    awk '{print $1 "\t" $2 "\t" $3 "\t0\t0\t" $5}' "$file" > "$output_file"
    
    # Check if the output file was created and is not empty
    if [ -s "$output_file" ]; then
        echo "Successfully processed $file and saved to $output_file"
    else
        echo "Failed to process $file or output file is empty"
    fi
done

echo "All files have been processed and saved to $output_directory."
