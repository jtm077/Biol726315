12Sep24

Today, we went through tasks 2-15 for Genomics Adventure Chapter 2:

Task 2: We filtered out the low quality reads and trimmed any sequences containing adaptor sequences using Trim Galore.

I ran this job using these scripts:
* [ecoli_trim.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/trim_galore/ecoli_trim.sh)
* [ecoli_trim.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/trim_galore/ecoli_trim.sbatch)

These files were outputted:
* [ecoli_trim_21125033_stderr.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/trim_galore%20outputs/ecoli_trim_21125033_stderr.txt)
* [ecoli_trim_21125033_stdout.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/trim_galore%20outputs/ecoli_trim_21125033_stdout.txt)
* [ecoli_trim_21125050_stderr.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/trim_galore%20outputs/ecoli_trim_21125050_stderr.txt)
* [ecoli_trim_21125050_stdout.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/trim_galore%20outputs/ecoli_trim_21125050_stdout.txt)

Task 3: We reduced our data using seqtk. 

We 'gzipped' the files produced.

Task 4: Aligning trimmed reads against a reference sequence.

We used 'BWA' program.

Task 5: We generated an index.

I ran this job using these scripts:
* [bwa_index.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/bw_index.sh)
* [bwa_index.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/bwa_index.sbatch)


Task 6: We aligned 'read_1' and 'read_2' to the reference genome. 

I ran this job using these scripts:
* [ecoli_bwa_mem.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_bwa_mem.sh)
* [ecoli_bwa_mem.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_bwa_mem.sbatch)

These files were outputted:
* [ecoli_bwa_21125606_stderr.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_bwa_21125606_stderr.txt)
* [ecoli_bwa_21125606_stdout.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_bwa_21125606_stdout.txt)
* [ecoli_bwa_21126055_stderr.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_bwa_21126055_stderr.txt)
* [ecoli_bwa_21126055_stdout.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_bwa_21126055_stdout.txt)

Task 7: Convert SAM file into a BAM file

I ran this job using these scripts:
* [ecoli_samtools_view.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_samtools_view.sh)
* [ecoli_samtools_view.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_samtools_view.sbatch)

These files were outputted:
* [ecoli_view_21126893_stderr.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_view_21126893_stderr.txt)
* [ecoli_view_21126893_stdout.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_view_21126893_stdout.txt)

Task 8: We removed potential PCR duplicates.

Our steps to do this included:
* sorting the BAM file by 'read name'
* made 'samtools' add special 'ms' and 'MC' tags.
* resort our BAM file by chromosomal/position coordinates.
* We marked the duplicates.
* Afterwards, we created an index. 

I marked the duplicates by running a job using these scripts:
* [ecoli_markdup.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_markdup.sh)
* [ecoli_markdup.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_markdup.sbatch)

These files were outputted:
* [ecoli_markdup_21127160_stderr.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_markdup_21127160_stderr.txt)
* [ecoli_markdup_21127160.stdout.txt](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bwa%20outputs/ecoli_markdup_21127160_stdout.txt)

Task 9: We generated a summary of our statistics. 

We did this by running 'samtools flagstat'.

And we got this files:
* [mappingstats](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/Mapping%20Statistics/mappingstats.txt)

Then, we removed all of our extra files we created during this process. 

Task 10: We used QualiMap to summarize the mapped alignments to assess the sequencing for any problems and biases in both sequencing and alignment. 

I ran this job using these scripts:
* [ecoli_qualimap.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_qualimap.sh)
* [ecoli_qualimap.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/BWA/ecoli_qualimap.sbatch)

This job outputted:
* [Qualimap report_ BAM QC.pdf](https://github.com/jtm077/Biol726315/blob/main/Genomic%20Adventures/bmqc%20outputs/Qualimap%20report_%20BAM%20QC.pdf)

Task 11: We used IGV to view our reference sequence, reference annotation, and BAM alignment. 
We opened the necessary files and viewed the BAM alignment as pairs. 
