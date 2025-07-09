# scripts/02_compute_returns.R
# Load libraries
library(quantmod)
library(magrittr)

# 1. Read raw USD/JPY xts object saved by 01_fetch_data.R
raw_xts <- readRDS("data/raw/USDJPY_xts.rds")

# 2. Compute log‐returns and drop NAs
USDJPY_returns <- diff(log(raw_xts)) %>% na.exclude()

# 3. Save cleaned returns
if (!dir.exists("data/processed")) dir.create("data/processed", recursive = TRUE)
saveRDS(USDJPY_returns, "data/processed/USDJPY_returns.rds")
