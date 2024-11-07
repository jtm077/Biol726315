#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=4
#SBATCH --mem 8G
#SBATCH --output=bwa_pseudo_index_%J_stdout.txt
#SBATCH --error=bwa_pseudo_index_%J_stderr.txt
#SBATCH --job-name=bwa_index
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/bwa_pseudo_index.sh