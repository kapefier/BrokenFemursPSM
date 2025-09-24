# Analysis of the dataset - HIP Fractures 2025 (Ferri)
#
# date: 2024-06-15
# author: Orlando Sagliocco

# List of required packages
required_packages <- c(
    "broom", "kableExtra", "pROC", "tidyverse", "parameters",
    "insight", "httpgd", "tableone"
)

# Install missing packages
installed <- required_packages %in% rownames(installed.packages())
if (any(!installed)) {
    install.packages(required_packages[!installed])
}

if (!requireNamespace("httpgd", quietly = TRUE)) {
  tryCatch({
    remotes::install_github("nx10/httpgd")
  }, error = function(e) {
    message("httpgd non disponibile, fallback a dispositivo png")
  })
}

# Load necessary libraries
lapply(required_packages, library, character.only = TRUE)

# 1. Data cleaning and descriptive statistics (frequencies, missing).

# Load the dataset
# now we usare using e a manipulated dataset
# optimal data cleaning routine will be created later on

data <- readRDS("/../data/HIPfracture-nonames-mock-dataset.rds")
head(data)
str(data)
summary(data)   

# Check for missing values
missing_summary <- sapply(data, function(x) sum(is.na(x)))
print(missing_summary)
