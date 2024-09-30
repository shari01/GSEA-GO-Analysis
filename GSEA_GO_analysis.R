# Install and load necessary packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

# Install required Bioconductor packages if not already installed
BiocManager::install("clusterProfiler", update = FALSE)
BiocManager::install("org.Hs.eg.db", update = FALSE)

# Load necessary libraries
library(clusterProfiler)
library(org.Hs.eg.db)
library(ggplot2)

# Load your gene data
gene_data <- read.csv("C:/Users/Sheryar Malik/sccdta.csv")

# Check the structure of your data
head(gene_data)

# Convert gene symbols to Entrez IDs
gene_ids <- bitr(gene_data$Gene_Name, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# Create a named vector of LogFC values
logfc_vector <- setNames(gene_data$LogFC, gene_ids$ENTREZID)

# Perform GO analysis (using Biological Processes as an example)
go_results <- enrichGO(gene = gene_ids$ENTREZID, 
                        OrgDb = org.Hs.eg.db, 
                        keyType = "ENTREZID", 
                        ont = "BP",  # Change to "MF" or "CC" if needed
                        pvalueCutoff = 0.05)

# View the results
head(go_results)

# Visualize GO results using a dot plot
dotplot(go_results, showCategory = 10) + 
  ggtitle("Gene Ontology Enrichment Analysis - Biological Processes") +
  theme_minimal()

# Visualize GO results using a bar plot
barplot(go_results, showCategory = 10) + 
  ggtitle("Gene Ontology Enrichment Analysis - Biological Processes") +
  theme_minimal()

# Save the plots
ggsave("C:/Users/Sheryar Malik/GO_Dotplot.png", plot = last_plot(), width = 10, height = 6)
ggsave("C:/Users/Sheryar Malik/GO_Barplot.png", plot = last_plot(), width = 10, height = 6)

# Save the GO results to a CSV file
write.csv(as.data.frame(go_results), "C:/Users/Sheryar Malik/GO_Results.csv", row.names = FALSE)

# Display a message upon completion
cat("GO analysis completed and results saved.\n")
