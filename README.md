# Stat-2102: Elementary Statistics and Probability Sessional (R)

Lab script built from the course syllabus: summarising data with graphs and numerical measures, probability models, hypothesis testing, correlation and regression. Written in R.

These are written from the syllabus topics. They are not my original lab questions, which I no longer have.

## Contents

| File | Topics |
|---|---|
| `r/statistics_lab.R` | Mean, median, SD, IQR, histogram, boxplot; binomial, Poisson and normal distributions; two-sample t-test, one-sample t-test, chi-squared test; correlation and linear regression |
| `results/r_statistics_lab_output.txt` | Full R console output |
| `results/r_statistics_lab.png` | The six plots |

## Run

```bash
cd r
Rscript statistics_lab.R
```

## Notes and limitations

- All data is simulated with `set.seed(42)`, so results are reproducible but are not real measurements.
- Tested on R 4.1.2.
