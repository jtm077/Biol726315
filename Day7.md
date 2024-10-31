10Oct24

This week we worked on a tutorial for RNA-Seq Analysis:

- The Data:
  We created symbolic links to the RNA-Seq reads in Dr. Toomey's folder, which already had read quality assessment and trimming done. We created these links in a folder named "RNAseq_Example", and we ran all the following commands in this folder.
  
  *Reference Transcriptome: The RNA-seq files were from human cells, so we used the human reference transcription:
    + https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/
    
    We added the coding sequences of _CYP2J19_, _BDH1L_, _TTC39B_ genes from our expression constructs.
    
- Pseudoalignment and quantification with Kallisto:
  We created another link to Dr. Toomey's index because running this would have taken awhile.
  
  *Transcription quantification: We did this by submitting an array job to OSCER.
    + Scripts for this job:

      *[kallisto.quant.sh](https://github.com/jtm077/Biol726315/blob/main/Scripts/RNAseq_Example/kallisto_quant.sh)
      
      *[kallisto.quant.args](https://github.com/jtm077/Biol726315/blob/main/Scripts/RNAseq_Example/kallisto_quant.args)
      
      *[kallisto_quant.sbatch](https://github.com/jtm077/Biol726315/blob/main/Scripts/RNAseq_Example/kallisto_quant.sbatch)
      
    + Output folder:
      
      *[output](https://github.com/jtm077/Biol726315/tree/main/DEG_Analysis/output)
      
    Before we left OSCER we used grep to pull the headers from the transcriptome file and piped it to a sed command. This parsed the headers and wrote the ID and gene symbols into a new file.
    
    + New file:
      
      *[TTC_headers.txt](https://github.com/jtm077/Biol726315/blob/main/DEG_Analysis/TTC_headers.txt)
      
- Differential gene expression ananlysis:                                                                                                                                                                                                     
  We used sleuth to compare transcript expression levels between treatment groups. We also used EnhancedVolcano package for plotting. After installing the necessary packages, we created a tab-separated list of treatment conditions for our samples.
  
  + Tab-separated list:
    
    *[ExpTable_TTC.txt](https://github.com/jtm077/Biol726315/blob/main/DEG_Analysis/ExpTable_TTC.txt)

  Then, we loaded the following packages:
  + sleuth
  + tidyverse
  + EnhancedVolcano
  + pheatmap
  
  Then, we setup the MetaData for our samples and used the 'sleuth_prep' command to aggregate the data from each samples into individual result folders. After this, we fit the model and calculated test statistics (running the Wald test). We ran 'sleuth_results' to recover the results. Because we are only interested in the transcripts that are significantly differentially expressed, we filtered by qval using dplyr. Then we set 'pval_aggreate = TRUE'to aggregate the mult. significant transcripts for the same gene and calculated gene-level tests.
  
- Volcano Plots:
  We generated a volcano plot to visualize the relative expression of all the transcripts between two conditions.

  *[Volcano_Plot](https://github.com/jtm077/Biol726315/blob/main/DEG_Analysis/Rplot01.pdf)
  
- Heatmap of transcripts:
  We also visualized this through a heatmap.

  *[Heatmap_of_Transcripts](https://github.com/jtm077/Biol726315/blob/main/DEG_Analysis/Rplot02.pdf)

- GO Analysis:
  Then we took our dataframe and copied it into ShinyGO.
    
