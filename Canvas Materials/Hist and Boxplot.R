hist(mtcars$mpg,
     main = "Histogram of MPG",
     xlab = "Miles per Gallon")

boxplot(mtcars$mpg,
        horizontal = TRUE,
        main = "Box Plot of MPG",
        xlab = "Miles per Gallon")
x=mtcars$mpg

x[1]=40

boxplot(x,
        horizontal = TRUE,
        main = "Box Plot of MPG",
        xlab = "Miles per Gallon")

#=====================================================
















#=====================================================


# Data
x = mtcars$mpg

# -------------------------
# Elaborate Histogram
# -------------------------

hist(x,
     breaks = 8,
     main = "Distribution of Miles Per Gallon",
     xlab = "Miles Per Gallon (MPG)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black",
     las = 1)

# Add a vertical line for the mean
abline(v = mean(x),
       col = "red",
       lwd = 3,
       lty = 2)

# Add a vertical line for the median
abline(v = median(x),
       col = "blue",
       lwd = 3,
       lty = 3)

# Add legend
legend("topright",
       legend = c("Mean", "Median"),
       col = c("red", "blue"),
       lwd = 3,
       lty = c(2, 3))


# -------------------------
# Modified Horizontal Box Plot
# -------------------------

boxplot(x,
        horizontal = TRUE,
        main = "Modified Box Plot of Miles Per Gallon",
        xlab = "Miles Per Gallon (MPG)",
        col = "lightgreen",
        border = "black",
        pch = 19,
        cex = 1.2)

# Add mean to the box plot
points(mean(x),
       1,
       pch = 18,
       col = "red",
       cex = 1.5)

# Add legend
legend("topright",
       legend = "Mean",
       pch = 18,
       col = "red",
       pt.cex = 1.5)

#========================================================




















#=====================================================
# Data
x = mtcars$mpg

# Rainbow histogram
hist(x,
     breaks = 8,
     main = "Distribution of Miles Per Gallon",
     xlab = "Miles Per Gallon (MPG)",
     ylab = "Frequency",
     col = rainbow(8),
     border = "black",
     las = 1)

# Mean
abline(v = mean(x),
       col = "black",
       lwd = 3,
       lty = 2)

# Median
abline(v = median(x),
       col = "purple",
       lwd = 3,
       lty = 3)

# Legend
legend("topright",
       legend = c("Mean", "Median"),
       col = c("black", "purple"),
       lwd = 3,
       lty = c(2, 3))

