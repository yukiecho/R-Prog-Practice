# X ~ N(0.05, (0.10)^2)
mu_x <- 0.05
sigma_x <- 0.10

# Pr(X > 0.10)
1 - pnorm(0.10, mean = mu_x, sd = sigma_x)

# Pr(X < -0.10)
pnorm(-0.10, mean = mu_x, sd = sigma_x)

# Pr(-0.05 < X < 0.15)
pnorm(0.15, mean = mu_x, sd = sigma_x) - pnorm(-0.05, mean = mu_x, sd = sigma_x)

# For the grid of values in x_vals, compute the values of the assumed normal density for the return on Microsoft stock and assign it to MSFT.
# For the grid of values in x_vals, compute the values of the assumed normal density for the return on Starbucks stock and assign it to SBUX
# Normally distributed monthly returns
x_vals <- seq(-0.25, 0.35, length.out = 100)
MSFT <- dnorm(x_vals, mean = 0.05, sd = 0.1)
SBUX <- dnorm(x_vals, mean = 0.025, sd = 0.05)

# Normal curve for MSFT
plot(x_vals, MSFT, type = "l", col = "blue", ylab = "Normal curves", 
     ylim = c(0, 8))

# Add a normal curve for SBUX
lines(x_vals,SBUX,col = "red")

# Add a plot legend
legend("topleft", legend = c("Microsoft", "Starbucks"),col = c("blue", "red"), lty = 1)

# Compute the 1% value-at-risk and print the result to the console.
# Compute the 5% value-at-risk and print the result to the console.
# R ~ N(0.04, (0.09)^2) 
mu_R <- 0.04
sigma_R <- 0.09

# Initial wealth W0 equals $100,000
W0 <- 100000

# 1% value-at-risk
W0 * qnorm(0.01, mean = mu_R, sd = sigma_R)

# 5% value-at-risk
W0 * qnorm(0.05, mean = mu_R, sd = sigma_R)
# Use the fact that the continuously compounded return quantile can be transformed to a simple return quantile with the transformation R=er−1. The exponential er can easily be computed with exp(r).
# r ~ N(0.04, (0.09)^2) 
mu_r <- 0.04
sigma_r <- 0.09

# Initial wealth W0 equals $100,000
W0 <- 100000

# The 1% value-at-risk
W0*(exp(qnorm(0.01,mean=mu_r,sd=sigma_r))-1)

# The 5% value-at-risk
W0*(exp(qnorm(0.05,mean=mu_r,sd=sigma_r))-1)

# The prices for Amazon (PA) are still in your workspace

# Cash dividend per share
DA <- 0.10

# Simple total return
RA_total <- (PA[2] + DA - PA[1]) / PA[1]

# Dividend yield
DY <- DA / PA[1]

# The simple monthly return on Amazon (RA) is still in your workspace

# Simple annual return
RA_annual <- (1 + RA)^12 - 1

# Continuously compounded annual return
rA_annual <- log(1 + RA_annual)

# Compute your portfolio shares if you invest $8,000 in Amazon and $2,000 in Costco. Moreover, compute the simple monthly return on the portfolio and assume that no dividends were paid.
# Portfolio shares
xA <- 8000 / 10000
xC <- 1 - xA

# Simple monthly return
xA * RA + xC * RC

# Matrices can be created with the matrix() function. You should supply the values as the first argument and specify the dimensions with the nrow and  ncol arguments. For example, matrix(c(-0.5, 0.5), nrow = 1, ncol = 2) creates a matrix with one row and two columns. By default, the matrix is filled column by column, but you can fill the matrix row by row by setting byrow = TRUE.
# Standard deviations and correlation
sig_x <- 0.10
sig_y <- 0.05
rho_xy <- 0.9

# Covariance between X and Y
sig_xy <- rho_xy * sig_x * sig_y

# Covariance matrix
Sigma_xy <- matrix(c(sig_x^2, sig_xy, sig_xy, sig_y^2), nrow = 2, ncol = 2)

# mvtnorm is an R library, containing extra functionality (see mvtnorm documentation), which makes it easy to simulate data from a bivariate (or more generally, a multivariate) normal distribution. 
# Load the mvtnorm package
library("mvtnorm");
# The covariance matrix (Sigma_xy) is still in your workspace

# Means
mu_x <- 0.05
mu_y <- 0.025

# Simulate 100 observations
set.seed(123)  # for reproducibility
xy_vals <- rmvnorm(100,mean=c(mu_x,mu_y),sigma=Sigma_xy)

head(xy_vals)

# Create scatterplot
plot(xy_vals,col="blue",pch=16,main="Bivariate normal:rho=0.9",cex=2,xlab="x",ylab="y")

# Straight lines can be added to a plot with the abline() function. You can use the argument h to specify the y-values of horizontal lines, and the argument  v to specify the x-values of vertical lines. For example, abline(h = 0) adds a horizontal line at 0.# Add lines
abline(h = mu_y, v = mu_x)
# Add a vertical line that indicates the mean of X and a horizontal line that indicates the mean of Y.

