#!/bin/bash

# Define the genome build you want to use
GENOME_BUILD=hg19  # Change to hg38 if needed

# Directory containing your BED files
BED_DIR="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/bed_files"

# Loop through each BED file in the directory
for BED_FILE in "$BED_DIR"/*.bed; do
    # Run the ClassifyCNV.py script on the current BED file
    python3 /lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/ClassifyCNV/ClassifyCNV.py --infile "$BED_FILE" --GenomeBuild "$GENOME_BUILD"
done
