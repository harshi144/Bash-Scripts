
source /programs/biogrids.shrc

cd /lab-share/Gene-Doan-e2/Public/Projects/Neuro_Reg_e3

sbatch -t 150:00:00 --mem-per-cpu=8000 --wrap="java -XX:ParallelGCThreads=2 -jar /programs/biogrids/x86_64-linux/gatk/4.5.0.0/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar GenotypeGVCFs \
    -R /lab-share/Gene-Doan-e2/Public/databases/genomes/g1k/human_g1k_v37.fasta \
    -V gendb://ADHD_Neuroreg_chr22 \
    -O ADHD_Neuroreg_chr21.vcf.gz"

