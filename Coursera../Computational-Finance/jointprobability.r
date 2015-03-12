#Probabilities for a bivariate (or more generally, a multivariate) normal distribution can be computed with the function pmvnorm #from package mvtnorm (see its documentation).
#You should supply the lower limits as the lower argument and the upper limits as the upper argument. Note that you can use -Inf #for −∞ and Inf for ∞. In addition, you can set the mean vector and the covariance matrix via the arguments mean and sigma, #respectively.
#Note that you can use args(pmvnorm) to display the arguments of the pmvnorm() function. Try this out in the console.

# Standard deviations and correlation
sig_x <- 0.10
sig_y <- 0.05
rho_xy <- 0.9
# Covariance between X and Y
sig_xy <- rho_xy * sig_x * sig_y
# Covariance matrix
Sigma_xy <- matrix(c(sig_x^2, sig_xy, sig_xy, sig_y^2), nrow = 2, ncol = 2)

# Means
mu_x <- 0.05
mu_y <- 0.025
# Simulate 100 observations
set.seed(123)  # for reproducibility
xy_vals <- rmvnorm(100, mean=c(mu_x, mu_y), sigma = Sigma_xy)
head(xy_vals)

# Create scatterplot
plot(xy_vals[, 1], xy_vals[, 2], pch = 16, cex = 2, col = "blue", 
     main = "Bivariate normal: rho=0.9", xlab = "x", ylab = "y")
# Add lines
abline(h = mu_y, v = mu_x)
# Add line segments
segments(x0 = 0, y0 = -1e10, x1 = 0, y1 = 0, col="red")
segments(x0 = -1e10, y0 = 0, x1 = 0, y1 = 0, col="red")

# Compute joint probability
pmvnorm(lower = c(-Inf, -Inf), upper = c(0, 0),mean = c(mu_x, mu_y), sigma = Sigma_xy)
