24Oct24

This week, we worked on Chapter 5 of the Genomics Advnetures. 

Task 1: Hybrid de novo Assembly
I learned about a new approach where you can comvine high quality illumina sequencing to get accurate reads with low wuality PacBio sequencing to enable the repeats to be spanned (alows it to be resolved). 

Task 2: QC
Ran QC with the following scripts:
*[pseudo_fastqc.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/fastqc/pseudo_fastqc.sbatch)
*[pseudo_fastqc.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/fastqc/pseudo_fastqc.sh)

These were outputted:
*[SRR491287_1_fastqc](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/fastqc/SRR491287_1.fastq.pdf)
*[SRR491287_2_fastqc](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/fastqc/SRR491287_2.fastq.pdf)

Task 3:Trim the Reads!
I trimmed the reads using the following scripts:
*[pseudo_trim.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/trimming/pseudo_trim.sbatch)
*[pseudo_trim.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/trimming/pseudo_trim.sh)

Task 4: Assembly Time
First, I constructed an assembly using only the short-read illumina data using spades through these scripts:
*[pseudo_short_assembly.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/assembly/pseudo_short_assembly.sbatch)
*[pseudo_short_assembly.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/assembly/pseudo_short_assembly.sh)

Resulting file:
*[contigs.fasta](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/short%20assembly/contigs.fasta)

Then we ran quast with these scripts:
*[pseudo_quast.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/quast/pseudo_quast.sbatch)
*[pseudo_quast.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/quast/pseudo_quast.sh)

Results of the quastreport.txt:
'''
Assembly                    contigs
# contigs (>= 0 bp)         527
# contigs (>= 1000 bp)      120
# contigs (>= 5000 bp)      102
# contigs (>= 10000 bp)     91
# contigs (>= 25000 bp)     73
# contigs (>= 50000 bp)     50
Total length (>= 0 bp)      6692025
Total length (>= 1000 bp)   6619701
Total length (>= 5000 bp)   6580295
Total length (>= 10000 bp)  6494932
Total length (>= 25000 bp)  6197435
Total length (>= 50000 bp)  5381166
# contigs                   129
Largest contig              248605
Total length                6626398
GC (%)                      59.00
N50                         93187
N75                         64551
L50                         22
L75                         43
# N's per 100 kbp           0.00
'''
Task 5: Hybrid Assembly
I did an assembly including the longer PacBio reads using these scripts:
*[pseudo_long_assembly.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/assembly/pseudo_long_assembly.sbatch)
*[pseudo_long_assembly.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/assembly/pseudo_long_assembly.sh)

Resulting file:
*[contigs.fasta](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/long%20assembly/contigs.fasta)

Then I ran quast with these scripts:
*[pseudo_long_quast.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/quast/pseudo_long_quast.sbatch)
*[pseudo_long_quast.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/quast/pseudo_long_quast.sh)

Here are the results of the quastreport.txt:
'''
Assembly                    contigs
# contigs (>= 0 bp)         300
# contigs (>= 1000 bp)      32
# contigs (>= 5000 bp)      30
# contigs (>= 10000 bp)     28
# contigs (>= 25000 bp)     25
# contigs (>= 50000 bp)     20
Total length (>= 0 bp)      6725842
Total length (>= 1000 bp)   6677010
Total length (>= 5000 bp)   6672688
Total length (>= 10000 bp)  6656532
Total length (>= 25000 bp)  6595226
Total length (>= 50000 bp)  6437266
# contigs                   34
Largest contig              1292976
Total length                6678398
GC (%)                      58.98
N50                         489830
N75                         355188
L50                         4
L75                         8
# N's per 100 kbp           0.00
'''

Task 6: Align Reads Back to Reference
I re-aligned the reads back to the assembly.

First I created the index using these scripts:
*[bwa_pseudo_index.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/bwa_pseudo_index.sbatch)
*[bwa_pseudo_index.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/bwa_pseudo_index.sh)

Then I mapped the illumina reads:
*[bwa_pseudo_mem.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/bwa_pseudo_mem.sbatch)
*[bwa_pseudo_mem.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/bwa_pseudo_mem.sh)

Converted them to bam:
*[samtools_pseudo_convert_to_bam.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_convert_to_bam.sbatch)
*[samtools_pseudo_convert_to_bam.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_convert_to_bam.sh)

Sorted:
*[samtools_pseudo_sort.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_sort.sbatch)
*[samtools_pseudo_sort.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_sort.sh)

Indexed:
*[samtools_pseudo_index.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_index.sbatch)
*[samtools_pseudo_index.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_index.sh)

And got its stats:
*[samtools_pseudo_stats.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_stats.sbatch)
*[samtools_pseudo_stats.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/alignment/samtools_pseudo_stats.sh)

Resulting stats file:
*[pseudo_illumina_sorted.stats](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/stats/pseudo_illumina_sorted.stats)

Then I did the same thing, but for mapping the PacBio data, using minimap2:
*[minimap_pseudo.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo.sbatch)
*[minimap_pseudo.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo.sh)

Converted them to bam:
*[minimap_pseudo_ctb.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_ctb.sbatch)
*[minimap_pseudo_ctb.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_ctb.sh)

Sorted:
*[minimap_pseudo_sort.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_sort.sbatch)
*[minimap_pseudo_sort.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_sort.sh)

Indexed:
*[minimap_pseudo_index.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_index.sbatch)
*[minimap_pseudo_index.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_index.sh)

And got its stats:
*[minimap_pseudo_stats.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_stats.sbatch)
*[minimap_pseudo_stats.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/pseudomonas/minimap2/minimap_pseudo_stats.sh)

Resulting stats file:
*[pseudo_pacbio_sorted.stats](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/stats/pseudo_pacbio_sorted.stats)

Task 7: IGV O'clock!
I loaded the assembled genome into IGV to observe and explore contigs.

Genome files:
*[pseudo_illumina_sorted.bam](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/IGV%20files/pseudo_illumina_sorted.bam)
*[pseudo_illumina_sorted.bam.bai](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/IGV%20files/pseudo_illumina_sorted.bam.bai)
*[Hybrid file](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/psuedomonas/long%20assembly/contigs.fasta)