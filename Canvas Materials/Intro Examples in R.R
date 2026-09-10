#============================================
# BASICS OF R PROGRAMMING - COMPREHENSIVE GUIDE
#============================================

# ----------
# 1. SETUP & COMMENTS
# ----------
# This is a comment - anything after '#' is ignored
# Run code by selecting lines and pressing Ctrl+Enter (Windows) or Cmd+Return (Mac)

# Set working directory (replace path)
# setwd("~/your_directory_path")


# ----------
# 2. BASIC OPERATIONS
# ----------
# Calculator operations
5 + 3    # Addition
10 - 4   # Subtraction
3 * 8    # Multiplication
15 / 3   # Division
2^3      # Exponentiation
7 %% 2   # Modulus (remainder)
sqrt(25) # Square root


# ----------
# 3. VARIABLES & DATA TYPES
# ----------
# Assignment operators (<- or =)
x <- 10        # Numeric
y <- "Hello"   # Character (string)
z <- TRUE      # Logical (boolean)

x = 20        # Numeric
y = "Bye"   # Character (string)
z = FALSE      # Logical (boolean)

# Print variables
print(x)
cat("Message:", y, "\n")  # Better for combined output

# Check data types
class(x)       # "numeric"
typeof(y)      # "character"
is.logical(z)  # TRUE

# Type conversion
as.character(x)  # "10"
as.numeric("25") # 25


# ----------
# 4. DATA STRUCTURES
# ----------
# Vectors (homogeneous elements)
num_vec = c(1, 3, 5)          # Numeric vector
char_vec = c("a", "b", "c" ,"d")       # Character vector
log_vec = c(TRUE, FALSE, TRUE)    # Logical vector
1:10                               # Sequence vector
num_vec*c(1,0,1)
num_vec*log_vec
log_vec
log_vec*1

# Vector operations
num_vec * 2        # Scalar multiplication
num_vec + c(2, 4, 6)  # Element-wise addition
sum(num_vec)       # Summation
mean(num_vec)      # Average
length(char_vec)   # Number of elements

# Factors (categorical data)
grades = c("A", "B", "A", "C", "B")
factor_grades = factor(grades)
factor_grades
levels(factor_grades)  # Shows categories

# Lists (heterogeneous elements)
person = list(
  name = "Alice",
  age = 30,
  scores = c(85, 92, 88)
)
person$name        # Access element
person[[3]]        # Access by index
person
# Data frames (tabular data)
df = data.frame(
  ID = 1:4,
  Name = c("John", "Emma", "Tom", "Lisa"),
  Age = c(28, 32, 25, 30),
  Passed = c(TRUE, TRUE, FALSE, TRUE)
)
View(df)            # View in spreadsheet-like format
head(df, 2)         # First 2 rows
nrow(df)            # Number of rows
ncol(df)            # Number of columns
df$Age              # Access column
df[2, ]             # Access row
df[3, "Name"]       # Access cell

df[, "Name"]   

# ----------
# 5. CONTROL STRUCTURES
# ----------
# If-else statements

# if (statement is true){
#  do this
# } else {
#  do this if not true
# }
temperature = 28
if (temperature > 30) {
  "Hot day!"
} else if (temperature > 20) {
  "Pleasant weather"
} else {
  "Cool day"
}

temperature = 35
if (temperature > 30) {
  "Hot day!"
} else if (temperature > 20) {
  "Pleasant weather"
} else {
  "Cool day"
}
temperature = 10
if (temperature > 30) {
  "Hot day!"
} else if (temperature > 20) {
  "Pleasant weather"
} else {
  "Cool day"
}

# For loops
for (i in 10:15) {
  cat("Iteration:", i, "\n")
}

for (x in 3:7){
  cat(x,"^2=",x^2,"\n")
}
for (x in 3:7){
  sprintf("%d^2=%d", x, x^2)
}
for (x in 3:7){
  print(sprintf("%d^2=%d", x, x^2))
}
x=10
sprintf("When you square %f you get %f",x,x^2)

# sprintf format specifiers in R
# %s: String, e.g., sprintf("Hello, %s!", "Alice") -> "Hello, Alice!"
# %d: Integer (decimal), e.g., sprintf("Age: %d", 25) -> "Age: 25"
# %f: Floating-point (fixed-point notation), e.g., sprintf("Value: %f", 3.14159) -> "Value: 3.141590"
# %e: Scientific notation, e.g., sprintf("Value: %e", 3.14159) -> "Value: 3.141590e+00"
# %g: General format (shorter of %f or %e), e.g., sprintf("Value: %g", 3.14159) -> "Value: 3.14159"
# %x: Hexadecimal (lowercase), e.g., sprintf("Hex: %x", 255) -> "Hex: ff"
# %X: Hexadecimal (uppercase), e.g., sprintf("Hex: %X", 255) -> "Hex: FF"
# %o: Octal, e.g., sprintf("Octal: %o", 8) -> "Octal: 10"
# %%: Literal %, e.g., sprintf("Discount: %d%%", 10) -> "Discount: 10%"


# While loop
# while(this is true){
#    do this stuff
# }
while (1==1)
{
  print(x)
}
while (1=1)
{
  print(x)
}

count = 1
while (count <= 3) {
  cat("Count:", count, "\n")
  count = count + 1
}


# ----------
# 6. FUNCTIONS
# ----------
# Built-in functions
seq(1, 10, by = 2)  # Sequence generation
seq(10,104,5)
rep(c(1,2), times=3) # Replicate values
rep(0,10)

# User-defined function
fahr_to_celsius = function(t) {
  celsius = (t - 32) * 5/9
  return(celsius)
}
fahr_to_celsius(77)  # Convert 77°F to °C
fahr_to_celsius(212)
fahr_to_celsius(32)
fahr_to_celsius(-40)
# ----------
# 7. BASIC PLOTTING
# ----------
# Scatter plot
x_vals = 1:10
y_vals = x_vals^2
plot(x_vals, y_vals, 
     main = "Quadratic Relationship",
     xlab = "X Values",
     ylab = "Y Values",
     col = "blue",
     pch = 19)

#=====================================
# Enhanced Quadratic Plot with Equation
x_vals <- seq(0, 10, length.out = 100)  # More points for smoother curve
y_vals <- x_vals^2

# Create the base plot
plot(x_vals, y_vals, 
     type = "n",  # Set up plot area without plotting points
     main = "Quadratic Relationship: y = x²",
     xlab = "X Values",
     ylab = "Y Values",
     xlim = c(0, 10),
     ylim = c(0, 100),
     las = 1)  # Makes y-axis labels horizontal

# Add grid lines
grid(col = "lightgray", lty = "dotted")

# Draw the quadratic curve
lines(x_vals, y_vals, 
      col = "red", 
      lwd = 2)

# Add points on top of the curve
k=10
points(x_vals[seq(1, 100, by = k)], y_vals[seq(1, 100, by = k)],  # Every 10th point
       col = "blue",
       pch = 19,
       cex = 1.2)

# Add mathematical annotation for the equation
text(2, 80, 
     expression(y == x^2), 
     cex = 1.5, 
     col = "darkred")


# Add legend
legend("topleft",
       legend = c("Quadratic Curve", "Sample Points"),
       col = c("red", "blue"),
       lty = c(1, NA),
       pch = c(NA, 19),
       lwd = c(2, NA),
       bty = "n")

#=====================================


# Histogram
hist(rnorm(1000),     # Random normal distribution
     breaks = 20,
     col = "lightgreen",
     main = "Normal Distribution")

# Bar plot
barplot(table(factor_grades), 
        col = c("green", "blue", "red"),
        main = "Grade Distribution")


# ----------
# 8. WORKING WITH PACKAGES
# ----------
# Install package (run once)
# install.packages("tidyverse")

# Load package
library(tidyverse)

# Check installed packages
installed.packages()


# ----------
# 9. HELP & DOCUMENTATION
# ----------
?mean         # Help for mean function
??"standard deviation"  # Search documentation
example(plot)  # Show function examples



# ----------
# 10. SAVING OUTPUT
# ----------
# Save workspace image
save.image("my_session.RData")

# Save specific object
save(df, file = "my_data.Rda")

# Save plot to file
png("my_plot.png")
plot(x_vals, y_vals)
dev.off()

# Write data to CSV
write.csv(df, "data_output.csv", row.names = FALSE)

# ----------
# 10 MATRIX OPERATIONS
# ----------

# Creating matrices
m1 = matrix(1:6, nrow = 2, ncol = 3)  # Fill by column (default)
m2 = matrix(1:6, nrow = 2, byrow = TRUE)  # Fill by row
diag_matrix <- diag(3)  # 3x3 identity matrix

cat("Matrix m1 (filled by column):\n")
print(m1)
cat("\nMatrix m2 (filled by row):\n")
print(m2)
cat("\n3x3 Identity matrix:\n")
print(diag_matrix)

# Special matrix constructors
zeros = matrix(0, 3, 3)  # 3x3 zero matrix
ones = matrix(1, 2, 4)   # 2x4 matrix of ones
random_mat = matrix(rnorm(9), 3, 3)  # 3x3 random normal matrix
random_mat
# Matrix attributes
dim(m1)      # Dimensions (rows, columns)
nrow(m1)     # Number of rows
ncol(m1)     # Number of columns
dimnames(m1) = list(c("Row1", "Row2"), c("Col1", "Col2", "Col3"))

# Matrix operations
A = matrix(1:4, nrow = 2)
B = matrix(c(1,0,0,1), nrow = 2)

A + B   # Element-wise addition
A * B   # Element-wise multiplication (Hadamard product)
A %*% B # True matrix multiplication

# Matrix algebra
t(A)        # Transpose
solve(A)    # Inverse (for square matrices)
det(A)      # Determinant
eigen(A)    # Eigenvalues and eigenvectors


# Matrix indexing and slicing
m1[1, 2]        # Element at row 1, column 2
m1[1, ]         # Entire first row
m1[, 2:3]       # Columns 2 through 3
m1[m1 > 3]      # Elements greater than 3

# Matrix functions
rowSums(A)      # Sum of each row
colMeans(A)     # Mean of each column
apply(A, 1, sum) # Apply function across rows (1) or columns (2)

# Solving linear systems
# Ax = b where:
A = matrix(c(2,1,-1,3), nrow=2)
A
b = c(4,7)
b
x = solve(A, b)  # Solution
x
# Matrix decomposition
svd(A)  # Singular value decomposition
qr(A)   # QR decomposition
chol(A) # Cholesky decomposition (for positive definite matrices)
A
B

# Combining matrices
rbind(A, B)  # Combine by rows
cbind(A, B)  # Combine by columns

# Sparse matrices (requires Matrix package)
# install.packages("Matrix")
library(Matrix)
sparse_mat = sparseMatrix(i = c(1,3), j = c(1,2), x = c(4,5))

# From canvas
