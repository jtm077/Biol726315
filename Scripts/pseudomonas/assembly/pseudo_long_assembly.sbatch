#!/bin/bash
#
#SBATCH --partition=64gb_24core
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem 62G
#SBATCH --output=pseudo_long_%J_stdout.txt
#SBATCH --error=pseudo_long_%J_stderr.txt
#SBATCH --job-name=pseudo_long
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/pseudo_long_assembly.sh