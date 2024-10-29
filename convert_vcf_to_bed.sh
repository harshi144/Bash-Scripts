#!/bin/bash

# Directory containing VCF.gz files
VCF_DIR="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV"

# Output directory for BED files
BED_DIR="/lab-share/Gene-Doan-e2/Public/Projects/ADHD/wesCNV/bed_files"

# Create output directory if it doesn't exist
mkdir -p "$BED_DIR"

# Loop through each VCF.gz file in the directory
for vcf in "$VCF_DIR"/*.vcf.gz; do
  # Extract base filename without extension
  base=$(basename "$vcf" .vcf.gz)

  # Convert VCF.gz to BED and swap 8th column with 4th column
  bcftools view "$vcf" | awk 'BEGIN {OFS="\t"} !/^#/ {temp=$4; $4=$7; $7=temp; gsub(/ +/, "\t"); gsub(/[<>]/, "", $4); if ($4 != "" && $4 != ".") print $1, $2, $3, $4}' > "$BED_DIR/$base.bed"

  echo "Converted $vcf to $BED_DIR/$base.bed"
done

echo "All files have been converted."
