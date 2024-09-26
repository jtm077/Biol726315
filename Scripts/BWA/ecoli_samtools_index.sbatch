#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem 16G
#SBATCH --output=ecoli_samtools_index_%J_stdout.txt
#SBATCH --error=ecoli_samtools_index_%J_stderr.txt
#SBATCH --job-name=ecoli_samtools_index
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/BWA/ecoli_samtools_index.sh