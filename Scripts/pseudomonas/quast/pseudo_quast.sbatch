#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=4
#SBATCH --mem 8G
#SBATCH --output=pseudo_quast_%J_stdout.txt
#SBATCH --error=pseudo_quast_%J_stderr.txt
#SBATCH --job-name=pseudo_quast
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/pseudo_quast.sh