#!/bin/bash

#SBATCH --job-name=attach_headings
#SBATCH --output=attach_headings.out
#SBATCH --error=attach_headings.err
#SBATCH --time=01:00:00
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=8G

# Define the input and output file paths
header_file="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/Annovar/output_with_combined_column.txt"
data_file="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/Annovar/test.txt"
output_file="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/Annovar/test_head.txt"

# Extract the header from the header file
header=$(head -n 1 $header_file)

# Add "Sample ID" to the second position in the header using awk
modified_header=$(echo $header | awk -F'\t' -v OFS='\t' '{print $1, "Sample ID", substr($0, index($0, $2))}')

# Write the modified header to the output file
echo -e $modified_header > $output_file

# Add the contents of the data file to the output file
tail -n +2 $data_file >> $output_file