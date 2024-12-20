rm(list=ls())
set.seed(1988)

# Define the target correlation matrix
cor_matrix <- matrix(c(
  1.0, 0.8, 0.5,
  0.8, 1.0, 0.3,
  0.5, 0.3, 1.0
), nrow = 3, byrow = TRUE)

# Cholesky decomposition
L <- chol(cor_matrix)

# Generate independent standard normal variables
n <- 100  # Number of observations
p <- 3    # Number of variables
independent_vars <- matrix(rnorm(n * p), nrow = n, ncol = p)

# Transform to correlated variables
correlated_vars <- independent_vars %*% t(L)

# Convert to a data frame for convenience
correlated_data <- as.data.frame(correlated_vars)
colnames(correlated_data) <- c("Var1", "Var2", "Var3")

# Verify the correlation structure
print(cor(correlated_data))

# Visualize the results
pairs(correlated_data, main = "Scatterplot Matrix of Correlated Variables")