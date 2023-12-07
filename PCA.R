# Load the mtcars dataset
data(mtcars)

# Extract the numeric columns (features)
mtcars_features <- mtcars[, 1:7]  # Using the first 7 columns for this example

# Perform PCA
pca_result <- prcomp(mtcars_features, scale. = TRUE)

# Summary of PCA
summary(pca_result)

# Accessing principal components
pca_components <- pca_result$rotation

# Plotting the variance explained by each principal component
plot(pca_result)

# Biplot of the first two principal components
biplot(pca_result)
