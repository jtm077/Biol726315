mkdir -p fastqc

fastqc *.fastq.gz --outdir /scratch/biol726315/BIOL7263_Genomics/class_project/seq_data/fastqc --threads 4
