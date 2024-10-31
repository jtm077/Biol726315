3Oct24

This week, I worked on Chapter 4 of the Genomics Adventure, which covered Genome & Transcriptome Annotation.

Task 1: De novo Assembly using short reads. 
I used the SPAdes program to get the best possible assembly for a given genome.To this we used the following scripts:

*[full_spades.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/full_spades.sh)
*[full_spades.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/full_spades.sbatch)

Task 2: Checking the assembly
I ran QUAST on our assembly and got this report file:
*[report.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/assembly%20outputs/report.txt)

Task 3: Map Reads Back to Assembly
I used BWA to index our contigs.fasta file and remap the reads. I did the following jobs within one script: (1)index the contigs and align QC reads, (2) convert SAM to BAM, (3) sort BAM file, (4) index BAM file. The script for this job is below:

*[align_de_novo.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/align_de_novo.sh)
*[align_de_novo.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/align_de_novo.sbatch)

Following this, I used samtools flagstat to obtain basic statistics:

Then, I ran qualimap to get more detailed information using these scripts:
*[qmap_de_novo.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/qmap_de_novo.sh)
*[qmap_de_novo.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/qmap_de_novo.sbatch)

The information outputted can be seen here:
*[qualimapReport](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/assembly%20outputs/bamqc/qualimapReport.html)

I did a quick blast search and the file below was outputted:

Task 4: View Assembly in IGV.

I viewed the assembly in IGV and explored the genome.

Task 5: annotation of de novo assembled contigs.
We annotated the contigs using BLAST and Pfam. I used codon table 9 (which defines the bacterial codon usage table). The orfs were restricted to sequences longer than 300 nucleotides. Here are the scripts for orf:

*[orfipy.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/orfipy.sh)
*[orfipy.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/orfipy.sbatch)

This generated a orfs.fa (predicted amino acid sequences) and a .bed file (genome locations for mapping in IGV):

*[orfs.fa](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/assembly%20outputs/orfs.fa)
*[orfs.bed](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/assembly%20outputs/orfs/orfs.bed)

We searched orfs against the Pfam HMM database of protein families using these scripts:

*[orf_blast.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/orf_blast.sh)
*[orf_blast.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/orf_blast.sbatch)

These scripts outputted this txt file:

*[orf_hit.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/assembly%20outputs/orfs/orf_best_hit.txt)

I downloadeed orfs.bed and orfs_hit.txt and then joined and rearranged with tidyverse commands in R:

# *[bed_file.txt](https://github.com/jtm077/Biol726315/blob/main/Scripts/assembly/bed_file.R)

This bed file was the result of this command:

*[orfs_gene.bed](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/assembly%20outputs/orfs/orfs_gene.bed)
