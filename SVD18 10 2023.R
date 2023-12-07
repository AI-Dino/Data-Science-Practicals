# Load the USArrests dataset
data("USArrests")

# Perform SVD on the dataset
svd_result <- svd(USArrests)

# Extract U, Sigma, and V matrices
U <- svd_result$u
Sigma <- diag(svd_result$d)
V <- svd_result$v

# Print the matrices
print("U (left singular vectors):")
print(U)

print("Sigma (singular values):")
print(Sigma)

print("V (right singular vectors):")
print(V)
