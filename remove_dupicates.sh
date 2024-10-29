#!/bin/bash

#SBATCH --job-name=remove_duplicates
#SBATCH --output=remove_duplicates.out
#SBATCH --error=remove_duplicates.err
#SBATCH --time=02:00:00   # adjust the time according to your file size
#SBATCH --partition=normal # change to your partition
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4  # adjust based on your resources
#SBATCH --mem=16G          # adjust based on your resources

# Load necessary modules if required
# module load <module_name>

# Define your input and output file paths
input_file="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/Annovar/joined_output.txt"
output_file="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/Annovar/remove_duplicates"

# Use sort and uniq to remove duplicate lines
sort $input_file | uniq > $output_file
