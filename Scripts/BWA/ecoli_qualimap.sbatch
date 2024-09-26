#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --mem 16G
#SBATCH --output=ecoli_qualimap_%J_stdout.txt
#SBATCH --error=ecoli_qualimap_%J_stderr.txt
#SBATCH --job-name=ecoli_qualimap
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/BWA/ecoli_qualimap.sh