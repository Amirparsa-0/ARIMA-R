# scripts/05_backtest_accuracy.R
# Load forecast for accuracy()
library(forecast)

# 1. Load returns
ret <- readRDS("data/processed/USDJPY_returns.rds")

# 2. Train/test split (80/20)
n_total    <- length(ret)
h          <- floor(0.2 * n_total)
train_size <- n_total - h

ret_ts    <- ts(as.numeric(ret), start = 1)
train_ts  <- window(ret_ts, end = train_size)
test_ts   <- window(ret_ts, start = train_size + 1)

# 3. Fit on train & forecast
fit_train <- auto.arima(train_ts, seasonal = FALSE)
fc_train  <- forecast(fit_train, h = h)

# 4. Compute & print accuracy metrics
acc <- accuracy(fc_train, test_ts)
print(acc)
