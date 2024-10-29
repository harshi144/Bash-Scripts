cd /lab-share/Gene-Doan-e2/Public/Projects/Neuro_Reg_e3/Neuroreg

rm analysis.sh

for chr in {1..21} X; do
  echo "sbatch -t 35:00:00 --mem-per-cpu=44000 -c 2 /lab-share/Gene-Doan-e2/Public/scripts/ASD_chromosome_annotation.v25.part1.sh /lab-share/Gene-Doan-e2/Public/Projects/Neuro_Reg_e3/Neuroreg Neuroreg Neuroreg_chr${chr}.vcf.gz ${chr} NeuroReg.ped yes v5_4 hg19 /lab-share/Gene-Doan-e2/Public/Projects/Neuro_Reg_e3/Neuroreg/temp /lab-share/Gene-Doan-e2/Public /lab-share/Gene-Doan-e2/Public" >> analysis.sh
done

sh analysis.sh
