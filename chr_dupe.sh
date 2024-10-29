#!/bin/sh

source /programs/biogrids.shrc

# Loop through chromosomes 1 to 21 and X
for chr in {1..21} X
do
    # Specify the VCF file for the current chromosome
    vcf_file="Neuroreg_chr${chr}.vcf.gz"

    # List of samples to remove
    samples_to_remove=$(bcftools query -l "$vcf_file" | grep "\-A" | tr '\n' ',' | sed 's/,$//')

    # Apply bcftools view with sample exclusion and overwrite the existing file
    bcftools view --force-samples -s "^$samples_to_remove" "$vcf_file" -O z -o "${vcf_file%.vcf.gz}_filtered.vcf.gz"

    # Replace the original file with the filtered file
    mv "${vcf_file%.vcf.gz}_filtered.vcf.gz" "$vcf_file"

    # Index the resultant VCF file
    bcftools index -ft --threads 2 "$vcf_file"
done
