# GSEA_GO_analysis.R
# GSEA and Gene Ontology Analysis

This repository contains an R script for performing Gene Ontology (GO) analysis using Gene Set Enrichment Analysis (GSEA) on microarray data from the GSE135304 dataset of squamous cell carcinoma in the lung.

## Overview

The script reads a CSV file containing gene names and their corresponding LogFC values, converts gene symbols to Entrez IDs, performs GO enrichment analysis, and generates visualizations of the results.

## Dataset

The analysis uses the GSE135304 dataset, which contains microarray data related to squamous cell carcinoma in the lung.

## Required Packages

The following R packages are required to run the script:
- `clusterProfiler`
- `org.Hs.eg.db`
- `ggplot2`

You can install these packages using the following commands in R:

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
install.packages("ggplot2")
