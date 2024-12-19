#!/bin/bash

# Define the directory to output the trimmed files
OUTPUT_DIR="/scratch/biol726315/BIOL7263_Genomics/class_project/seq_data"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# List of file pairs to trim
declare -a PAIRS=(
    "ovary1_0.1_read_1.fastq.gz ovary1_0.1_read_2.fastq.gz"
    "ovary1_5.0_read_1.fastq.gz ovary1_5.0_read_2.fastq.gz"
    "ovary1_9.0_read_1.fastq.gz ovary1_9.0_read_2.fastq.gz"
    "ovary2_0.1_read_1.fastq.gz ovary2_0.1_read_2.fastq.gz"
    "ovary2_5.0_read_1.fastq.gz ovary2_5.0_read_2.fastq.gz"
    "ovary2_9.0_read_1.fastq.gz ovary2_9.0_read_2.fastq.gz"
    "ovary3_0.1_read_1.fastq.gz ovary3_0.1_read_2.fastq.gz"
    "ovary3_5.0_read_1.fastq.gz ovary3_5.0_read_2.fastq.gz"
    "ovary3_9.0_read_1.fastq.gz ovary3_9.0_read_2.fastq.gz"
)

# Loop through each pair
for pair in "${PAIRS[@]}"; do
    set -- $pair
    READ1=$1
    READ2=$2

    echo "Trimming $READ1 and $READ2..."
    
    # Run trim_galore in paired-end mode
    trim_galore --paired --gzip --fastqc "$READ1" "$READ2" --output_dir "$OUTPUT_DIR"
done

echo "Trimming completed."
