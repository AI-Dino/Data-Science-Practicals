# Load the required library
library(e1071)

# Load the iris dataset (it's built-in)
data(iris)

# Split the dataset into training and testing sets (you can use your own method)
set.seed(123)  # for reproducibility
sample_indices <- sample(1:nrow(iris), nrow(iris) * 0.7)  # 70% for training
train_data <- iris[sample_indices, ]
test_data <- iris[-sample_indices, ]

# Perform SVM classification
svm_model <- svm(Species ~ ., data = train_data, kernel = "linear")

# Make predictions on the test set
predictions <- predict(svm_model, test_data)

# Evaluate the model (you can use other evaluation methods)
confusion_matrix <- table(predictions, test_data$Species)
print(confusion_matrix)
print(predictions)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Accuracy:", accuracy, "\n")
