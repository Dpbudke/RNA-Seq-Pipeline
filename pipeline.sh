#!/bin/bash

# RNA-seq pipeline

# 1. Quality Control
fastqc input_reads.fastq -o qc_output

# 2. Read Alignment
hisat2 -x reference_genome -U input_reads.fastq -S aligned_reads.sam

# 3. Quantification
featureCounts -a annotation.gtf -o counts.txt aligned_reads.sam

# 4. Differential Expression Analysis
Rscript deseq2_analysis.R
