# scripts/01_fetch_data.R
# 1. Install & load required packages
required_pkgs <- c(
  "quantmod",   # for getSymbols()
  "forecast",   # for forecasting / ggAcf, etc.
  "ggfortify",  # for autoplot()
  "magrittr",   # for %>%
  "tseries"     # for stationarity tests later
)
new_pkgs <- setdiff(required_pkgs, installed.packages()[, "Package"])
if (length(new_pkgs)) install.packages(new_pkgs)
lapply(required_pkgs, library, character.only = TRUE)

# 2. Download the last 180 days of USD/JPY from OANDA
from_date <- Sys.Date() - 179
USDJPY_xts <- getSymbols(
  "USD/JPY",
  src       = "oanda",
  from      = from_date,
  to        = Sys.Date(),
  auto.assign = FALSE
)

# 3. (Optional) Inspect the first few rows
head(USDJPY_xts)

# 4. Save the raw series for later steps
if (!dir.exists("data/raw")) dir.create("data/raw", recursive = TRUE)
saveRDS(USDJPY_xts, file = "data/raw/USDJPY_xts.rds")
