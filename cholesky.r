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
n <- 1000 
p <- 3   
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

L <- t(chol(sigma))
tau <- diag(c(1,2,3))
y <- t(tau %*% L %*% t(x))

#############
############# Verify correlation
#############

print(round(cor(y), 2))
print(sigma)

#############
############# Print correlation matrix
#############

print("Generated Correlation Matrix:")
print(round(cor(correlated_data), 2))

print("Target Correlation Matrix:")
print(sigma)

#############
############# Visualize the results
#############

pairs(y, main = "Scatterplot Matrix of Correlated Variables")
