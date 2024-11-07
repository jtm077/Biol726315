#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=4
#SBATCH --mem 8G
#SBATCH --output=pseudo_trim_%J_stdout.txt
#SBATCH --error=pseudo_trim_%J_stderr.txt
#SBATCH --job-name=pseudo_trim
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/pseudo_trim.sh