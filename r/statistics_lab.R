# Elementary statistics and probability lab in R
set.seed(42)
out <- file.path("..", "results")
dir.create(out, showWarnings = FALSE)
png(file.path(out, "r_statistics_lab.png"), width = 1500, height = 1000, res = 130)
par(mfrow = c(2, 3))

# 1. Descriptive statistics on simulated exam marks
marks <- round(rnorm(60, mean = 68, sd = 12))
cat("== Descriptive statistics ==\n"); print(summary(marks))
cat("SD:", round(sd(marks), 3), " Variance:", round(var(marks), 3), " IQR:", IQR(marks), "\n")
hist(marks, breaks = 10, col = "grey70", main = "Histogram of marks", xlab = "marks")
boxplot(marks, horizontal = TRUE, main = "Boxplot of marks", col = "grey80")

# 2. Binomial, Poisson, Normal
cat("\n== Distributions ==\n")
cat("Binomial(n=10,p=0.3): P(X=3) =", round(dbinom(3, 10, 0.3), 5), " P(X<=3) =", round(pbinom(3, 10, 0.3), 5), "\n")
cat("Poisson(lambda=4): P(X=2) =", round(dpois(2, 4), 5), " P(X>=6) =", round(1 - ppois(5, 4), 5), "\n")
cat("Normal(100,15): P(85<X<115) =", round(pnorm(115, 100, 15) - pnorm(85, 100, 15), 5), "\n")
x <- 0:10; plot(x, dbinom(x, 10, 0.3), type = "h", lwd = 6, col = "grey30", main = "Binomial(10, 0.3)", ylab = "P(X=k)")
curve(dnorm(x, 100, 15), 55, 145, main = "Normal(100, 15)", ylab = "density"); abline(v = c(85, 115), lty = 2)

# 3. Hypothesis tests
cat("\n== Hypothesis tests ==\n")
a <- rnorm(30, 70, 10); b <- rnorm(30, 75, 10)
tt <- t.test(a, b); print(tt)
print(t.test(marks, mu = 65))
tab <- matrix(c(30, 20, 15, 35), nrow = 2, dimnames = list(c("A", "B"), c("Pass", "Fail")))
print(chisq.test(tab))

# 4. Correlation and regression
cat("\n== Regression ==\n")
hours <- runif(40, 1, 10); score <- 40 + 5 * hours + rnorm(40, 0, 6)
fit <- lm(score ~ hours); print(summary(fit)); cat("Pearson r =", round(cor(hours, score), 4), "\n")
plot(hours, score, pch = 19, col = "grey30", main = "Linear regression"); abline(fit, lwd = 2)
dev.off()
