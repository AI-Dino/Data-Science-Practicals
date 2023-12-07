library(e1071)
# Load the Iris dataset
data(iris)
library(caret)

set.seed(123)  # For reproducibility
train_index <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]
# Train the Naive Bayes classifier
nb_classifier <- naiveBayes(Species ~ ., data = train_data)
# Predict on the test set
test_predictions <- predict(nb_classifier, newdata = test_data)
# Create a confusion matrix
confusion_matrix <- table(Actual = test_data$Species, Predicted = test_predictions)
confusion_matrix

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
accuracy


