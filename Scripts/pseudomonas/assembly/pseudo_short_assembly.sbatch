#!/bin/bash
#
#SBATCH --partition=64gb_24core
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem 48G
#SBATCH --output=pseudo_short_%J_stdout.txt
#SBATCH --error=pseudo_short_%J_stderr.txt
#SBATCH --job-name=pseudo_short
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/pseudo_short_assembly.sh