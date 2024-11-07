#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=4
#SBATCH --mem 8G
#SBATCH --output=minimap_pseudo_%J_stdout.txt
#SBATCH --error=minimap_pseudo_%J_stderr.txt
#SBATCH --job-name=minimap_pseudo
# 

bash /home/biol726315/BIOL7263_Genomics/scripts/pseudomonas/minimap_pseudo.sh