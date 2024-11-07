#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=4
#SBATCH --mem 8G
#SBATCH --output=samtools_pseudo_stats_stdout.txt
#SBATCH --error=samtools_pseudo_stats_%J_stderr.txt
#SBATCH --job-name=samtools_pseudo_stats
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/samtools_pseudo_stats.sh