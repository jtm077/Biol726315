12Sep24

Today, we went through tasks 2-15 for Genomics Adventure Chapter 2:

Task 2: We filtered out the low quality reads and trimmed any sequences containing adaptor sequences using Trim Galore.

I ran this job using these scripts:
* ecoli_trim.sh
* ecoli_trim.sbatch

These files were outputted:
* ecoli_trim_21125033_stderr.txt
* ecoli_trim_21125033_stdout.txt
* ecoli_trim_21125050_stderr.txt
* ecoli_trim_21125050_stdout.txt

Task 3: We reduced our data using seqtk. 

We 'gzipped' the files produced.

Task 4: Aligning trimmed reads against a reference sequence.

We used 'BWA' program.

Task 5: We generated an index.

I ran this job using these scripts:
* bwa_index.sh
* bwa_index.sbatch

These files were outputted:
* bwa_index_21125562_stderr.txt
* bwa_index_21125562_stdout.txt


Task 6: We aligned 'read_1' and 'read_2' to the reference genome. 

I ran this job using these scripts:
* ecoli_bwa_mem.sh
* ecoli_bwa_mem.sbatch

These files were outputted:
* ecoli_bwa_21125606_stderr.txt
* ecoli_bwa_21125606_stdout.txt
* ecoli_bwa_21126055_stderr.txt
* ecoli_bwa_21126055_stdout.txt

Task 7: Convert SAM file into a BAM file

I ran this job using these scripts:
* ecoli_samtools_view.sh
* ecoli_samtools_view.sbatch

These files were outputted:
* ecoli_view_21126893_stderr.txt
* ecoli_view_21126893_stdout.txt

Task 8: We removed potential PCR duplicates.

Our steps to do this included:
* sorting the BAM file by 'read name'
* made 'samtools' add special 'ms' and 'MC' tags.
* resort our BAM file by chromosomal/position coordinates.
* We marked the duplicates.
* Afterwards, we created an index. 

I marked the duplicates by running a job using these scripts:
* ecoli_markdup.sh
* ecoli_markdup.sbatch

These files were outputted:
* ecoli_markdup_21127160_stderr.txt
* ecoli_markdup_21127160.stdout.txt

Task 9: We generated a summary of our statistics. 

We did this by running 'samtools flagstat'.

And we got this files:
* mappingstats

Then, we removed all of our extra files we created during this process. 

Task 10: We used QualiMap to summarize the mapped alignments to assess the sequencing for any problems and biases in both sequencing and alignment. 

I ran this job using these scripts:
* ecoli_qualimap.sh
* ecoli_qualimap.sbatch

This job outputted:
* qualimapReport.html

Task 11: