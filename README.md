# ARIMA-R
.
.
├── README.md
├── .gitignore
├── LICENSE
├── data
│   ├── raw               # Placeholder and raw xts RDS from 01_fetch_data.R
│   │   └── .gitkeep
│   └── processed         # Log-return RDS from 02_compute_returns.R
│       └── .gitkeep
├── scripts               # R scripts for each step of the workflow
│   ├── 01_fetch_data.R
│   ├── 02_compute_returns.R
│   ├── 03_stationarity_checks.R
│   ├── 04_fit_arima.R
│   └── 05_backtest_accuracy.R
└── output
    ├── plots             # PNG/PDF charts: ACF, PACF, forecasts, diagnostics
    │   └── .gitkeep
    └── models            # Serialized model objects (.rds)
        └── .gitkeep



## Features
For demonstration download of the last 180 days of USD/JPY spot rates from OANDA
- Conversion to log-returns and removal of missing values

- Stationarity testing (ADF, KPSS) and autocorrelation diagnostics (ACF, PACF)

- ARIMA model fitting with automatic order selection (auto.arima)

- Residual diagnostics using checkresiduals() and Ljung–Box tests

- 10-day ahead forecasting with 80% and 95% prediction intervals

- Back-testing via time-based train/test split and accuracy metrics (ME, RMSE, MAE, MAPE, MASE, ACF1, Theil’s U)

## Dependencies
The following R packages are required:

install.packages(c(
  "quantmod",
  "forecast",
  "ggfortify",
  "magrittr",
  "tseries"
))

## Usage
Execute each script in sequential order from your shell or R console:

| Script                    | Purpose                                               |
|---------------------------|-------------------------------------------------------|
| 01_fetch_data.R           | Download desired data and save as raw xts object     |
| 02_compute_returns.R      | Compute log-returns and save cleaned series           |
| 03_stationarity_checks.R  | Run ADF/KPSS tests and plot ACF/PACF of returns       |
| 04_fit_arima.R            | Fit ARIMA, check residuals, and plot forecasts        |
| 05_backtest_accuracy.R    | Back-test on hold-out set and print accuracy metrics  |


## Script Descriptions
01_fetch_data.R Downloads USD/JPY spot rates and saves the raw xts object.

02_compute_returns.R Transforms the series into log-returns and stores the clean series.

03_stationarity_checks.R Runs ADF and KPSS tests; plots ACF and PACF of the return series.

04_fit_arima.R Fits an ARIMA model on returns, checks residuals via checkresiduals(), and plots forecasts.

05_backtest_accuracy.R Splits returns into train/test sets, forecasts on hold-out data, and calculates accuracy metrics.

## Outputs

- `data/processed/USDJPY_returns.rds` – cleaned log-return series  
- `output/plots/` – PNG/PDF of raw series, diagnostics, and forecasts  
- `output/models/arima_fit.rds` – serialized ARIMA model  
- **Console** – stationarity test results, residual diagnostics, and accuracy tables


## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
## Contributing
- Fork the repository.

- Create a feature branch (feature/your-feature).

- Commit your changes and push the branch.

- Open a pull request describing your enhancement.
#Any further enhancements and suggestions are appreciated.
