26Sep24

This week, we did 'Genomics Adventure Chapter 3 - Assembly of Unmapped Reads'. All of these were done in the same folder - 'unmapped_assembly'.

Task 1: Extracting Unmapped Reads
First, we used samtools to identify the correct bit flag (12). After that, we filtered the BAM file that we got from Chapter 2 (can be found in Day 2) using samtools. In order to extract the unmapped reads, we needed the reads to be in FASTQ format. Using bedtools, we converted these BAM files using the following scripts:

*[bam_to_fasta.sh](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/bam_to_fasta.sh)

*[bam_to_fasta.sbatch](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/bam_to_fasta.sbatch)

Task 2: We checked the output files to ensure the entries in read 1 and read 2 had the same header. Then we evaluated it with fastqc before moving on.

Task 3: De-novo assembly
We used SPAdes to assemble the reads using these scripts:

*[unmapped_spades.sh](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_spades.sh)

*[unmapped_spades.sbatch](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_spades.sbatch)

This run outputted these files:

*[params.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/params.txt)

*[contigs.fasta](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/contigs.fasta)

*[scaffolds.fasta](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/scaffolds.fasta)

*[assembly_graph.fastg](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/assembly_graph.fastg)

Task 4: Assesment of Assemblies
Using QUAST, we generated statistics on the assembly using these scripts:

*[unmapped_quast.sh](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_quast.sh)

*[unmapped_quast.sbatch](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_quast.sbatch)

It generated a folder ('quast') with statistics. We looked at this txt file specifically:

*[report.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/quast/report.txt)

Task 5: Analysing the de novo Assembled Reads
We analyse these by searching for which genes are present by searching the contigs against databses. We did not run these ourselves because they would take forever. There were pre-computed files available for us to review:

*[contigs.fasta.blastn](https://github.com/jtm077/Biol726315/blob/main/precomputed/unmapped_assembly/spades_assembly/contigs.fasta.blastn)

Task 6: Obtain Open Reading Frames
First, we called open the reading frames within the contigs with EMBOSS package program 'getorf'. We used codon table 11, which defines the bacterial codon usage. We ran this job using these scripts:

*[unmapped_orf.sh](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_orf.sh)

*[unmapped_orf.sbatch](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_orf.sbatch)

Then, we were supposed to search open reading frames against NCBI non-redundant database. This would also take forever, so we did not run this ourselves. Then, we did some additional checks using the BLAST+ package to search contigs against the reference genome. We did this using these scripts:

*[unmapped_blastn.sh](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_blastn.sh)

*[unmapped_blastn.sbatch](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_blastn.sbatch)

This was outputted:

*[unmapped_blast_to_genome](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/unmapped_blast_to_genome)

Task 7: Run Open Reading Frames Through pfam_scan
We searched the pfam database of Hidden Markov Models to see which protein families are contained within this contig. We did this using these scripts:

*[unmapped_pfam.sh](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_pfam.sh)

*[unmapped_pfam.sbatch](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/scripts/unmapped_pfam.sbatch)

This was outputted:

*[contigs.orf.pfam](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/unmapped_assembly/spades_assembly/contigs.orf.pfam)
