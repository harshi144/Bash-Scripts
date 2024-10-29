#!/bin/sh

source /programs/biogrids.shrc
## Specify the chromosome 22 VCF file
vcf_file="Neuroreg_chr22.vcf.gz"

# Apply bcftools view with sample exclusion and overwrite the existing file
bcftools view -s ^04C28530-A,^04C28892-A,^04C29418-A,^04C31310-A,^04C31481-A,^04C31512-A,^04C37880-A,^05C44370-A,^05C44371-A,^05C44374-A,^05C44375-A,^10C102890-A,^MH0142246-A,^MH0142557-A,^MH0143659-A,^MH0144872-A,^MH0146225-A,^MH0146408-A,^MH0146448-A,^MH0147252-A,^MH0147829-A,^MH0147831-A,^MH0148785-A,^MH0149420-A,^MH0149819-A,^MH0149821-A,^MH0149897-A,^MH0150018-A,^MH0150679-A,^MH0150681-A,^MH0151561-A,^MH0152973-A,^MH0153773-A,^MH0153998-A,^MH0154052-A,^MH0156424-A,^MH0156425-A,^MH0157925-A,^MH0158582-A,^MH0158709-A,^MH0158948-A,^MH0160256-A,^MH0163693-A,^MH0164766-A,^MH0164899-A,^MH0166369-A,^MH0168368-A,^MH0168514-A,^MH0169052-A,^MH0175462-A,^MH0176035-A,^MH0179085-A,^MH0181485-A,^NJT00157-A,^NJT00222-A,^NJT00699-A,^NJT00705-A "$vcf_file" -O z -o "${vcf_file%.vcf.gz}_filtered.vcf.gz"

# Replace the original file with the filtered file
mv "${vcf_file%.vcf.gz}_filtered.vcf.gz" "$vcf_file"

# Index the resultant VCF file
bcftools index -ft --threads 2 "$vcf_file"

