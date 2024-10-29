cd /lab-share/Gene-Doan-e2/Public/Projects/ADHD/Freeze4WES



sbatch -t 32:00:00 --mem-per-cpu=5000 /lab-share/Gene-Doan-e2/Public/scripts/ASD_chromosome.finalizing.v15.sh /lab-share/Gene-Doan-e2/Public/Projects/ADHD/Freeze4WES ADHDWES.freeze4 0.001 GenewgEncodeGencodeCompV28 2 5 3 5 no /lab-share/Gene-Doan-e2/Public/Projects/ADHD/Freeze4WES/PED/ADHD.cohort.txt 10 yes 0.05 ADHDFreeze4WES /lab-share/Gene-Doan-e2/Public /lab-share/Gene-Doan-e2/Public