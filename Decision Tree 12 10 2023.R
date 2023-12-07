# Load the required libraries
library(rpart)
library(rpart.plot)

# Load the "mtcars" dataset (built-in dataset in R)
data(mtcars)

# Split the dataset into features (X) and target (y)
X <- mtcars[, -1]  # Features (excluding the first column, which is the car model)
y <- mtcars$mpg   # Target (miles per gallon)

# Build the decision tree model
model <- rpart(y ~ ., data = data.frame(X, y), method = "anova")

# Visualize the decision tree
rpart.plot(model, box.palette = "auto", type = 3, extra = 1)