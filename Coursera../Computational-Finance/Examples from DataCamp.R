# The sbux_df data frame is already loaded in your work space

# Find indices associated with the dates 3/1/1994 and 3/1/1995
index_1 <- which(sbux_df$Date =="3/1/1994")
index_2 <- which(sbux_df$Date =="3/1/1995")

# Extract prices between 3/1/1994 and 3/1/1995
some_prices <- sbux_df[index_1:index_2,2]

# The sbux_df data frame is already loaded in your work space

# Create a new data frame that contains the price data with the dates as the row names
sbux_prices_df <- sbux_df[, "Adj.Close", drop=FALSE]
rownames(sbux_prices_df) <- sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
# because row name is the date
price_1 <- sbux_prices_df["3/1/1994",1]
price_2 <- sbux_prices_df["3/1/1995",1]

# Let us make a better plot by adding the following arguments to the plot function: type="l" specifies a line plot, 
# col="blue" indicates that the line should be blue, lwd=2 doubles the line thickness, ylab="Adjusted close" adds a y-axis label 
# And main="Monthly closing price of SBUX" adds a title.
plot(sbux_df$Adj.Close,type="l",col="blue",lwd=2,ylab="Adjusted close",main ="Monthly closing price of SBUX",legend(x='topleft',legend='SBUX', lty=1, lwd=2, col='blue'

# Denote n the number of time periods
n <- nrow(sbux_prices_df)
sbux_ret <- (sbux_prices_df[2:n,1]-sbux_prices_df[1:(n-1),1])/sbux_prices_df[1:(n-1),1]
# Calculate the simple return,Rt=(Pt−Pt−1)/Pt−1
# Notice that sbux_ret is not a data frame object,it's a "numeric" class
class(sbux_ret)

# Now add dates as names to the vector and print the first elements of sbux_ret to the console to check
names(sbux_ret) <- sbux_df[2:181,1]
head(sbux_ret)

## Continuous Compounding
# The sbux_df data frame is already loaded in your work space
sbux_prices_df <- sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n <- nrow(sbux_prices_df)
sbux_ret <- ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret <- log(sbux_prices_df[2:n,1]) - log(sbux_prices_df[1:(n-1),1])

# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) <- sbux_df[2:n,1]

# Compare the simple and cc returns
head(X <-  cbind(sbux_ret,sbux_ccret))

# The simple returns (sbux_ret) and the continuously compounded returns (sbux_ccret) have been preloaded in your workspace

# Plot the returns on the same graph
plot(sbux_ret, type="l", col="blue", lwd=2, ylab="Return",
               main="Monthly Returns on SBUX")

# Add horizontal line at zero
abline(h=0)

# Add a legend
legend(x="bottomright", legend=c("Simple", "CC"), 
       lty=1, lwd=2, col=c("blue","red"))

# Add the continuously compounded returns
lines(sbux_ccret,col="red",lwd=2)

# Instructions for above codes
# Your task is to add the continuously compounded returns to the plot. 
# This can be done with the lines() function, having sbux_ccret as a first argument. 
# Furthermore, the line should be red and its thickness should be set to 2. 
# You can do that by setting the col and lwd arguments.

# Assign to the variable sbux_gret the gross returns (which is the simple return + 1).
# Assign to sbux_fv a vector that contains the future values of the $1 invested in SBUX for every time period.
# Have a look at the plot. Would it have been a good idea to invest in SBUX?
# The simple returns (sbux_ret) and the continuously compounded returns (sbux_ccret) have been preloaded in your workspace

# Compute gross returns
sbux_gret <- 1 + sbux_ret

# Compute future values
sbux_fv <- cumprod(sbux_gret)

# Plot the evolution of the $1 invested in SBUX as a function of time
plot(sbux_fv, type="l", col="blue", lwd=2, ylab="Dollars", 
     main="FV of $1 invested in SBUX")
