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
  
  Then, we setup the MetaData for our samples and used the 'sleuth_prep' command to aggregate the data from each samples into individual result folders. After this, we fit the model and calculated test statistics (running the Wald test). We ran 'sleuth_results' to recover the results:
  
  '''
  > head(transcripts_all, 10)
        target_id   gene          pval          qval         b      se_b mean_obs   var_obs
1  NM_001384818.1 PRRC2B 3.257746e-112 2.333751e-107  9.180827 0.4078420 3.897266 25.370898
2     NM_201378.4   PLEC  7.133144e-45  2.554985e-40  5.454296 0.3880557 4.709731  9.105510
3     NM_005560.6  LAMA5  2.119075e-38  5.060139e-34  8.168898 0.6304172 3.391302 20.046290
4     HOFI_TTC39B   <NA>  3.125429e-37  5.597409e-33  8.024288 0.6293657 3.948250 19.792079
5     NM_130440.4  PTPRF  4.094137e-34  5.865834e-30  1.309210 0.1075102 7.793013  0.526805
6     NM_014680.5  BLTP2  1.705087e-33  2.035788e-29  8.340445 0.6915440 3.746274 20.962528
7     NM_005334.3  HCFC1  9.665174e-33  9.891201e-29  7.978311 0.6694962 3.296008 19.105366
8  XM_005250983.3   PLEC  1.924058e-31  1.722922e-27  2.685866 0.2302500 6.928724  2.227780
9  XM_047421892.1   PLEC  5.797167e-31  4.614352e-27 -3.599663 0.3111001 5.099954  3.946645
10    NM_002184.4  IL6ST  8.606497e-29  6.165436e-25  7.793514 0.6999980 3.329170 18.315942
      tech_var     sigma_sq smooth_sigma_sq final_sigma_sq
1  0.002082568  0.103697515     0.247420124     0.24742012
2  0.111467572  0.114413321     0.070724895     0.11441332
3  0.014533950  0.019241107     0.581604909     0.58160491
4  0.048170876  0.545980961     0.226060846     0.54598096
5  0.011962814  0.003781762     0.005374840     0.00537484
6  0.392200834 -0.275173176     0.325148830     0.32514883
7  0.014576249 -0.002908329     0.657761394     0.65776139
8  0.048359599  0.031162979     0.008232621     0.03116298
9  0.104605526 -0.030388724     0.040569419     0.04056942
10 0.103492366  0.014362938     0.631503481     0.63150348
'''

  Because we are only interested in the transcripts that are significantly differentially expressed, we filtered by qval using dplyr. Then we set 'pval_aggreate = TRUE'to aggregate the mult. significant transcripts for the same gene and calculated gene-level tests. 
  
  + Results from filter and aggregation:
  '''
  genes_all <- sleuth_results(so, 'treatTTC', show_all = FALSE, pval_aggregate = TRUE)

> head(genes_all, 10)
   target_id num_aggregated_transcripts sum_mean_obs_counts          pval          qval
1       PLEC                         31           104.05922 3.247615e-208 7.959903e-204
2     PRRC2B                          4            24.04712 4.374874e-128 5.361408e-124
3      HCFC1                          9            25.87346  1.019680e-51  8.330782e-48
4     PTPN13                         17            72.39147  5.179964e-37  3.174023e-33
5      LAMA5                          5            18.15877  4.211684e-36  2.064568e-32
6      BLTP2                          7            28.34303  1.676552e-32  6.848713e-29
7      PTPRF                          7            27.65212  2.520152e-30  8.824131e-27
8    GOLGA8A                         15            74.21208  3.195410e-30  9.789938e-27
9     TRIP12                         35           108.74276  9.269410e-30  2.524369e-26
10      UBR4                         30           102.90138  4.706700e-27  1.153612e-23
      
  '''
  
- Volcano Plots:
  We generated a volcano plot to visualize the relative expression of all the transcripts between two conditions.
  
- Heatmap of transcripts:
  We also visualized this through a heatmap.
    