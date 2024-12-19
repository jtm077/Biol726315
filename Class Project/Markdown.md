# My Project

## Project Background
### Study System
In this study, we are using tissues collected from _Danio rerio_ (zebrafish). Zebrafish are shallow freshwater fish that are great models for research due to their genes, which are 70% similar to human genes, as well as their adequate size and ability to reproduce in large quantities. These organisms can withstand up to 100 atm of pressure, anything beyond results in mortality.

### Project Questions(s) and Hypothesis
This project aims to see which genes are differentially expressed when zebrafish are exposed to increasing amounts of hydrostatic pressure. Based off passed research, we expect to see genes involved in protein structure and cell membrane structure. Other marine organisms exposed to high pressure have experienced changes in secondary structure of their proteins. As for their cell membranes, past work has shown that they experience an increase in membrane fluidity and and a reduction in membrane thickness.

### Briefly describe study design
We analyzed ovary tissues from female zebrafish exposed to the following pressure ranges: 0.1 MPa, 5.0 MPa, 9.0 MPa. We analyzed three tissue samples from each pressure treatment (total of 9 tissue samples), where we used the 0.1 MPa treatment as the control, since it is not too far off from the normal hydrostatic pressure exerted upon them in their natural habitats. To do this analyses we:
* Downlaoded RNA Sequencing Data and reference transcriptome from NCBI
* Quality checked with FASTQC
* Trimmed with Trim Galore
* Aligned and Counted with Kallisto
* Differential Gene Expression (DEG) Analysis with Sleuth & TopGO in RStudio

## Data Sources
**!THIS DATA IS NOT FROM THE MIKA LAB!**

The data used in this analysis was pulled from the NCBI database. The RNA sequencing was obtained using mirVana™ miRNA Isolation Kit (Ambion-1561, Thermo Fisher
Scientific, Inc, USA). The samples and conditions are as followed:

| Tissue     | Pressure Level |
| ---------- | -------------- |
| Ovary1_0.1 | 0.1 MPa        |
| Ovary2_0.1 | 0.1 MPa        |
| Ovary3_0.1 | 0.1 MPa        |
| Ovary1_5.0 | 5.0 MPa        |
| Ovary2_5.0 | 5.0 MPa        |
| Ovary3_5.0 | 5.0 MPa        |
| Ovary1_9.0 | 9.0 MPa        |
| Ovary2_9.0 | 9.0 MPa        |
| Ovary3_9.0 | 9.0 MPa        |

[Paper](https://pmc.ncbi.nlm.nih.gov/articles/PMC8920842/#s02) where data is pulled from.

## Analysis and Results
### QC
We quality checked each file locally using the following .sh file (We did not utilize .sbatch because I used a local computer instead of a supercomputer such as OSCER that can use .sbatch):
* [fastqc.sh](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/fastqc.sh)

Read quality reflects the accuracy of sequencing data, with metrics like **Phred scores**, **read length**, and **GC content** indicating reliability. High-quality reads are essential for accurate downstream analyses, while poor-quality reads can introduce errors. Tools like **FastQC** help assess and improve read quality. The read qualities for this analysis were very good, averaging a score of 35-36 for each paired sequence reading. 


### Trimming
We used trimgalore to trim all of our reads. The following .sh file also runs another QC on the trimmed files to ensure we are not diminishing quality by too much:
* [trimgalore.sh](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/trimgalore.sh)


### Kallisto
#### index
Before we could align these reads, we needed an index for Kallisto to utilize during alignment. After downloading the reference transcriptome from NCBI, we used the following .sh file to index the reference:
* [kallisto_index.sh](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/kallisto_index.sh)

#### quant
Then we proceeded to use the outputted .idx file to quanitfy the reads with the following .sh file:
* [kallisto quant](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/kallisto_quant.sh)


### Sleuth in RStudio
#### Volcano 

```
#read in sample tables - be sure to set correct path 

metadata <- read.table(file = "ExpTable_Press.txt", sep='\t', header=TRUE, stringsAsFactors = FALSE)
  
#this command sets up paths to the kallisto output that we will process in the following steps
  
metadata <- dplyr::mutate(metadata,
                            path = file.path('quant', sample, 'abundance.h5'))
  
#then we check the metadata to ensure it is in correct formatting
>metadata
  
  
#Read in headers for the transcripts that we aligned to with kallisto
#These will be mapped in the sleuth_prep command below
  
ttn<-read_delim("Press_headers.txt", col_names = FALSE)
  
colnames(ttn)<-c("target_id","gene")
```

After this, we processed the data with sleuth_prep:
```
so <- sleuth_prep(metadata, full_model = ~treat, target_mapping = ttn, extra_bootstrap_summary = TRUE, read_bootstrap_tpm = TRUE, aggregation_column = "gene")

```

Next, we fitted the model and calculate test statistics:
```
#fit model specified above
so <- sleuth_fit(so)

#print the model
models(so)

#calculate the Wald test statistic for 'beta' coefficient on every transcript 
so <- sleuth_wt(so, 'treatPress')

Next we will recover the results:
#extract the wald test results for each transcript 
transcripts_all <- sleuth_results(so, 'treatTTC', show_all = FALSE, pval_aggregate = FALSE)

We can look at our data:
> head(transcripts_all, 10)

Now we can filter by significance:
#filtered by significance 
transcripts_sig <- dplyr::filter(transcripts_all, qval <= 0.05)

Now we will select the top 50 significant transcripts, do not be alarmed if there are not 50 that just means we have less than 50 significant genes.

transcripts_50 <- dplyr::filter(transcripts_all, qval <= 0.05) %>%
head(50)

In case we have multiple significant transcripts for the same gene, you can aggregate these transcripts and calculate gene-level tests. To do this we can set pval_aggregate = TRUE. 
genes_all <- sleuth_results(so, 'treatTTC', show_all = FALSE, pval_aggregate = TRUE)

> head(genes_all, 10)
```

Then, we made our volcano plot:
```
  #extract the gene symbols, qval, and b values from the Wlad test results
  forVolacano<-data.frame(transcripts_all$gene, transcripts_all$qval, transcripts_all$b)
  
  #rename the columns of the dataframe
  colnames(forVolacano)<-c("gene","qval","b")
  
  #plot
  EnhancedVolcano(forVolacano,
                  lab = forVolacano$gene,
                  x = 'b',
                  y = 'qval',
                  xlab = "\u03B2",
                  labSize = 3,
                  legendPosition = "none")
```

* [Resulting Volcano Plot](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/Volcano_Map.png)

From our volcano map, you can see that we got a single significantly upregulated gene, nucleoporin 62-like protein (_nup62l_).

#### Heat Map
We exported data within the sleuth object with kallisto_table so we could generate a heat map to visualize our results:
```
k_table <- kallisto_table(so, normalized = TRUE)

k_DEG <- k_table %>%
right_join(transcripts_50, "target_id")
```

Then, we began creating our heat map:
```
k_DEG_select<-k_DEG %>%
#apply log10 transformation to the tpm data
mutate(log_tpm = log10(tpm+1)) %>%
#select the specifc columns to plot
dplyr::select(target_id, sample, log_tpm, gene) %>%
#create "label" from the transcript id and gene symbol
mutate(label = paste(target_id, gene))%>%
#pivot data frame to a wide format
pivot_wider(names_from = sample, values_from = log_tpm) %>%
#drop the target_id and gene variables
dplyr::select(!target_id & !gene) %>%
#convert label to row name
column_to_rownames("label") %>%
#convert to matrix
as.matrix(rownames.force = TRUE) 

#plot with pheatmap!
pheatmap(k_DEG_select, cexRow = 0.4, cexCol = 0.4, scale = "none")
```

* [Resulting Heat Map](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/Heat_Map.png)

From our heat map, you can see that we have many genes that have a change in regulation level when exposed to pressure. Some standouts include Zgc:153867, which is downregulated by quite a bit when exposed to higher pressures. There are also _setd9_ and _akr1a1b_, which are upregulated when exposed to higher pressures.

### TopGO in R
We did a gene ontology (GO) analysis. First, we prepared our input data:
```
#filter for transcripts enriched in the Press treatment
transcripts_up <- dplyr::filter(transcripts_all, qval <= 0.05, b > 0)

up<-transcripts_up %>%
  dplyr::select(gene)

#filter for transcripts depleted in the Press treatment
transcripts_down <- dplyr::filter(transcripts_all, qval <= 0.05, b < 0)

down<-transcripts_down %>%
  dplyr::select(gene)

#output the full transcript list
all<-transcripts_all %>%
  dplyr::select(gene)

#copy to clipboard and paste into topGO
writeClipboard(as.character(up))

#copy to clipboard and paste into topGO "gene_universe"
writeClipboard(as.character(all))
```

We used the characters copied to our clipboard to prepare data one last time for topGO:
```
#create a gene universe with all of our genes for reference using what is in your clipboard from the writeClipboard(as.character(all)) command:
gene_universe <- c(genes) #past your clipboard

#differentially expressed genes (DEGs)
deg_genes_up <- c(genes) # past your clipboard from the writeClipboard(as.characters(up))

# Create a named factor indicating DEGs
gene_list <- factor(as.integer(gene_universe %in% deg_genes_up))
names(gene_list) <- gene_universe

#Now, we will generate GO annotations for the zebrafish gene universe:
geneID2GO <- annFUN.org(whichOnto = "BP",  # Choose "BP", "MF", or "CC"
                      feasibleGenes = gene_universe, 
                      mapping = "org.Dr.eg.db", 
                      ID = "symbol")  # Use "ENSEMBL" or "ENTREZID" if applicable
```

Then, we ran the enrichment analysis:
```
# Fisher's exact test
results_fisher <- runTest(go_data, algorithm = "classic", statistic = "fisher")

# Adjusted algorithm (e.g., weight)
results_weight <- runTest(go_data, algorithm = "weight", statistic = "fisher")
```

Examining the results:
```
# Get top significant terms
top_results <- GenTable(go_data, classicFisher = results_fisher, topNodes = 10)
print(top_results)
```

We retrieved the full results by running this command:
```
# Extract all terms and save to a file
all_results <- GenTable(go_data, classicFisher = results_fisher, weightFisher = results_weight, orderBy = "weightFisher", ranksOf = "classicFisher", topNodes = length(results_fisher@score))
write.csv(all_results, "go_analysis_results.csv", row.names = FALSE)
```

* [Enrichment Analysis Results](https://github.com/jtm077/Biol726315/blob/main/Class%20Project/GO_Analysis.png)

From our enrichment analysis, we can see that there are enriched pathways dealing with DNA repair and protein synthesis and modification.

## Conclusions
From our significant gene findings from our volcano map, we can theorize that _nup62l_ has a potential role in the pressure response. In our GO Analysis, there are DNA repair and protein synthesis pathways being enriched, and these could be the organism's attempts to maintain homeostasis and cell stability when exposed to this extreme environmental stress. The upregulation of genes such as _ark1a1b_ show signs to zebrafish having mechanisms to handle oxidative stress. In conclusion, zebrafish show a level of plasticity to adapt to their environments, possibly by changing developmental or increasing cellular repair mechanism activty.
