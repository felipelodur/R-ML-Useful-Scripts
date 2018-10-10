# 1. Shapiro Test: Testing for normality
# p < 0.05, the null-hypothesis that it is normally distributed can be rejected.
normaly_disb <- rnorm(100, mean=5, sd=1) # generate a normal distribution
shapiro.test(normaly_disb)
not_normaly_disb <- runif(100)
shapiro.test(not_normaly_disb)


# 2. One Sample t-Test: Testing the mean of a sample from a normal distribution
# p-Value is not less than significance level (0.05),  therefore the null hypothesis that the mean=10 cannot be rejected
x <- rnorm(50, mean = 10, sd = 0.5)
t.test(x, mu=10) # testing if mean of x could be


# 3. Wilcoxon Signed Rank Test
# Testing the mean of a sample when normal distribution is not assumed
# p < 0.05, reject the null hypothesis and accept the alternate mentioned in your R code’s output.
wilcox.test(input.vector, mu = m, conf.int = TRUE)


# 4. Two Sample t-Test and Wilcoxon Rank Sum Test: Comparing mean of two samples
# If the p-Value is less than significance level (ideally 0.05), reject the null hypothesis that  both means are the are equal.
x <- c(0.80, 0.83, 1.89, 1.04, 1.45, 1.38, 1.91, 1.64, 0.73, 1.46)
y <- c(1.15, 0.88, 0.90, 0.74, 1.21)
wilcox.test(x, y, alternative = "g")        # greater
t.test(1:10, y = c(7:20))      # P = .00001855


# 5. Kolmogorov And Smirnov Test: Test if two samples have the same distribution
# Kolmogorov-Smirnov test is used to check whether 2 samples follow the same distribution. 
# p < 0.05 implies x and y from different distributions
x <- rnorm(50)
y <- runif(50)
ks.test(x, y)  # perform ks test

x <- rnorm(50)
y <- rnorm(50)
ks.test(x, y)  # perform ks test


# 6. Fisher’s F-Test: Test if two samples have same variance
# Alternatively fligner.test() and bartlett.test() can be used for the same purpose
var.test(x, y)  # Do x and y have the same variance?


# 7. Chi Squared Test: Test the independence of two variables in a contingency table
# Chi-squared test can be used to test independence of two categorical variables. 
# If the p-Value is less that 0.05, we fail to reject the null hypothesis that the x and y are independent.
chisq.test(matrix, correct = FALSE)  # Yates continuity correction not applied
# or
summary(table(x, y)) # performs a chi-squared test.


# 8. Correlation: Test the linear relationship of two variables
# Significant correlation
cor.test(x, y) # where x and y are numeric vectors.

# 9. AutoCorrelation: Durbin-Watson
# Performs the Durbin-Watson test for autocorrelation of disturbances
# The Durbin-Watson statistic is always between 0 and 4. A value of 2 means that there is no autocorrelation in the sample. 
# Values from 0 to less than 2 indicate positive autocorrelation and values from more than 2 to 4 indicate negative autocorrelation.
x <- rep(c(-1,1), 50)
y1 <- 1 + x + err1
dwtest(y1 ~ x)

# 10. Other tests
fisher.test(contingencyMatrix, alternative = "greater")  # Fisher's exact test to test independence of rows and columns in contingency table
friedman.test()  # Friedman's rank sum non-parametric test 




