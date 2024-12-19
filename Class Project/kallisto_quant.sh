#!/bin/bash

# Define the paths
INDEX="/scratch/biol726315/BIOL7263_Genomics/class_project/seq_data/zebrafish_transcripts.idx"
OUTPUT_DIR="/scratch/biol726315/BIOL7263_Genomics/class_project/seq_data/quant"
THREADS=4
BOOTSTRAPS=50

# Define the read pairs and output names
declare -A samples=(
    ["ovary1_0.1"]="ovary1_0.1_read_1_val_1.fq.gz ovary1_0.1_read_2_val_2.fq.gz"
    ["ovary1_5.0"]="ovary1_5.0_read_1_val_1.fq.gz ovary1_5.0_read_2_val_2.fq.gz"
    ["ovary1_9.0"]="ovary1_9.0_read_1_val_1.fq.gz ovary1_9.0_read_2_val_2.fq.gz"
    ["ovary2_0.1"]="ovary2_0.1_read_1_val_1.fq.gz ovary2_0.1_read_2_val_2.fq.gz"
    ["ovary2_5.0"]="ovary2_5.0_read_1_val_1.fq.gz ovary2_5.0_read_2_val_2.fq.gz"
    ["ovary2_9.0"]="ovary2_9.0_read_1_val_1.fq.gz ovary2_9.0_read_2_val_2.fq.gz"
    ["ovary3_0.1"]="ovary3_0.1_read_1_val_1.fq.gz ovary3_0.1_read_2_val_2.fq.gz"
    ["ovary3_5.0"]="ovary3_5.0_read_1_val_1.fq.gz ovary3_5.0_read_2_val_2.fq.gz"
    ["ovary3_9.0"]="ovary3_9.0_read_1_val_1.fq.gz ovary3_9.0_read_2_val_2.fq.gz"
)

# Loop through the samples and run Kallisto
for sample in "${!samples[@]}"; do
    echo "Processing $sample..."
    kallisto quant \
        -i "$INDEX" \
        -o "$OUTPUT_DIR/$sample" \
        -t "$THREADS" \
        -b "$BOOTSTRAPS" \
        ${samples[$sample]}
done

echo "Kallisto quantification completed with bootstraps!"
