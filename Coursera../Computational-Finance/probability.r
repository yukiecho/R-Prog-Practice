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
