# Analysis of the dataset - HIP Fractures 2025



## Installazione e caricamento dei pacchetti

```r
required_packages <- c(
    "broom", "kableExtra", "pROC", "tidyverse", "parameters",
    "insight"
)

installed <- required_packages %in% rownames(installed.packages())
if (any(!installed)) install.packages(required_packages[!installed])

lapply(required_packages, library, character.only = TRUE)
```
## 1. Data cleaning
Al momento un mock dataset


```r
data <- readRDS("/../data/HIPfracture-nonames-mock-dataset.rds")

# Prime righe
head(data)

# Struttura
str(data)

# Sommario statistico
summary(data)

# Valori mancanti
missing_summary <- sapply(data, function(x) sum(is.na(x)))
print(missing_summary)
```
