set -e
true
true
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/spades-hammer /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/corrected/configs/config.info
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/python /home/mbtoomey/.conda/envs/BIOL7263_Genomics/share/spades/spades_pipeline/scripts/compress_all.py --input_file /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/corrected/corrected.yaml --ext_python_modules_home /home/mbtoomey/.conda/envs/BIOL7263_Genomics/share/spades --max_threads 16 --output_dir /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/corrected --gzip_output
true
true
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/spades-core /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K21/configs/config.info /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K21/configs/careful_mode.info
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/spades-core /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K33/configs/config.info /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K33/configs/careful_mode.info
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/spades-core /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K55/configs/config.info /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K55/configs/careful_mode.info
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/spades-core /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/configs/config.info /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/configs/careful_mode.info
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/python /home/mbtoomey/.conda/envs/BIOL7263_Genomics/share/spades/spades_pipeline/scripts/copy_files.py /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/before_rr.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/before_rr.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/assembly_graph_after_simplification.gfa /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/assembly_graph_after_simplification.gfa /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/final_contigs.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/contigs.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/first_pe_contigs.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/first_pe_contigs.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/strain_graph.gfa /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/strain_graph.gfa /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/scaffolds.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/scaffolds.fasta /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/scaffolds.paths /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/scaffolds.paths /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/assembly_graph_with_scaffolds.gfa /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/assembly_graph_with_scaffolds.gfa /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/assembly_graph.fastg /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/assembly_graph.fastg /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/K77/final_contigs.paths /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/contigs.paths
true
true
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/python /home/mbtoomey/.conda/envs/BIOL7263_Genomics/share/spades/spades_pipeline/scripts/correction_iteration_script.py --corrected /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/contigs.fasta --assembled /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/misc/assembled_contigs.fasta --assembly_type contigs --output_dir /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly --bin_home /home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/python /home/mbtoomey/.conda/envs/BIOL7263_Genomics/share/spades/spades_pipeline/scripts/correction_iteration_script.py --corrected /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/scaffolds.fasta --assembled /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/misc/assembled_scaffolds.fasta --assembly_type scaffolds --output_dir /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly --bin_home /home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin
true
/home/mbtoomey/.conda/envs/BIOL7263_Genomics/bin/python /home/mbtoomey/.conda/envs/BIOL7263_Genomics/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/scaffolds.fasta --misc_dir /scratch/biol726315/BIOL7263_Genomics/sequencing_data/ecoli/unmapped_assembly/spades_assembly/misc --threshold_for_breaking_scaffolds 3
true