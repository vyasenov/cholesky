# Part of this code was genrated by ChatGPT in December 2024

#############
############# Clear worspace
#############

rm(list=ls())
set.seed(1988)

#############
############# Generate data
#############

# Generate independent standard normal variables
n <- 1000  # Number of observations
p <- 3    # Number of variables
x <- matrix(rnorm(n * p), nrow = n, ncol = p)

# Define the target correlation matrix
sigma <- matrix(c(
  1.0, 0.8, 0.5,
  0.8, 1.0, 0.3,
  0.5, 0.3, 1.0
), nrow = p, byrow = TRUE)

#############
############# Perform Cholesky decomposition
#############

L <- chol(sigma)
y <- x %*% t(L)
correlated_data <- as.data.frame(y)

#############
############# Print correlation matrix
#############

print(round(cor(correlated_data), 2))
print(sigma)

#############
############# Visualize the results
#############

pairs(correlated_data, main = "Scatterplot Matrix of Correlated Variables")