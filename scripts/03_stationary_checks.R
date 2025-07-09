# scripts/03_stationarity_checks.R
# Install & load what we need
required_pkgs <- c("tseries", "forecast", "ggfortify", "magrittr")
new_pkgs <- setdiff(required_pkgs, installed.packages()[, "Package"])
if (length(new_pkgs)) install.packages(new_pkgs)
lapply(required_pkgs, library, character.only = TRUE)

# 1. Load log-returns
ret <- readRDS("data/processed/USDJPY_returns.rds")

# 2. Stationarity tests
print(adf.test(ret))       # Augmented Dickey-Fuller
print(kpss.test(ret))      # KPSS

# 3. Plot ACF & PACF
p_acf  <- ggAcf(ret)  + ggtitle("ACF of USD/JPY Log-Returns")
p_pacf <- ggPacf(ret) + ggtitle("PACF of USD/JPY Log-Returns")

# 4. Save plots
if (!dir.exists("output/plots")) dir.create("output/plots", recursive = TRUE)
ggsave("output/plots/acf_returns.png", plot = p_acf)
ggsave("output/plots/pacf_returns.png", plot = p_pacf)
