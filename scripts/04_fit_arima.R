# scripts/04_fit_arima.R
# Install & load libraries
required_pkgs <- c("forecast", "ggfortify")
new_pkgs <- setdiff(required_pkgs, installed.packages()[, "Package"])
if (length(new_pkgs)) install.packages(new_pkgs)
lapply(required_pkgs, library, character.only = TRUE)

# 1. Load returns
ret <- readRDS("data/processed/USDJPY_returns.rds")

# 2. Fit ARIMA (no further transformation)
fit_ret <- auto.arima(ret, seasonal = FALSE)

# 3. Save the model
if (!dir.exists("output/models")) dir.create("output/models", recursive = TRUE)
saveRDS(fit_ret, "output/models/arima_fit.rds")

# 4. Residual diagnostics
checkresiduals(fit_ret)

# 5. Forecast 10 days ahead
fc_ret <- forecast(fit_ret, h = 10, level = c(80, 95))
p_fc <- autoplot(fc_ret) +
        labs(
          title = "10-Day Ahead Forecast of USD/JPY Log-Returns",
          caption = "80% & 95% PI"
        )

# 6. Save forecast plot
if (!dir.exists("output/plots")) dir.create("output/plots", recursive = TRUE)
ggsave("output/plots/forecast_returns.png", plot = p_fc)
