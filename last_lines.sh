#!/bin/bash

# Define the directory containing the error files
error_dir="/lab-share/Gene-Doan-e2/Public/Projects/Neuro_Reg_e3/NeuroReg_e3_AN00001725/Reports/pre_processing"
# Define the output file
output_file="/lab-share/Gene-Doan-e2/Public/Projects/Neuro_Reg_e3/last_lines.txt"

# Clear the output file if it exists
> "$output_file"

# Loop through all output files in the directory
for output_file in "$output_dir"/*.out; do
  # Check if the file exists
  if [[ -f "$output_file" ]]; then
    # Extract the last line of the output file and append it to the output file
    tail -n 1 "$output_file" >> "$output_file"
  fi
done

echo "Last lines from output files have been written to $output_file"