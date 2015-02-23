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
plot(sbux_df$Adj.Close,type="l",col="blue",lwd=2,ylab="Adjusted close",main ="Monthly closing price of SBUX",legend(x='topleft',legend='SBUX', lty=1, lwd=2, col='blue')
