# Analysis of the dataset - HIP FRACTURE 2025 (Ferri)
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

# Load necessary libraries
lapply(required_packages, library, character.only = TRUE)

# 1. Data cleaning and descriptive statistics (frequencies, missing).

# Load the dataset
# now we use a manipulated dataset - datacleaning will be created later on
# data <- readRDS("/home/R/FerriFermori2025/HIPfracture-nonames-mock-dataset.rds")


data <- readRDS("/../data/HIPfracture-nonames-mock-dataset.rds")
head(data)
view(data)

# Check for missing values
missing_summary <- sapply(data, function(x) sum(is.na(x)))
print(missing_summary)



