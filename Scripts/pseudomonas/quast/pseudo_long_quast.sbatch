#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=4
#SBATCH --mem 8G
#SBATCH --output=pseudo_long_quast%J_stdout.txt
#SBATCH --error=pseudo_long_quast%J_stderr.txt
#SBATCH --job-name=pseudo_long_quast
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/pseudo_long_quast.sh