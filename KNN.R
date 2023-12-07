# Load required libraries
install.packages("caret")
library(dplyr)
library(ggplot2)
library(caret)

# Read the Titanic dataset
data <- Titanic_Dataset

# Display the first 5 rows
head(data, 5)

# Create a countplot
ggplot(data, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar() +
  labs(title = "Survival Count by Passenger Class") +
  theme_minimal()

# Display data information
str(data)

# Calculate and fill missing values in 'Age'
mean_age <- mean(data$Age, na.rm = TRUE)
data$Age[is.na(data$Age)] <- mean_age

# Remove unwanted columns
unwanted_cols <- c('PassengerId', 'Name', 'Cabin', 'Ticket', 'Fare')
data <- data[, !(names(data) %in% unwanted_cols)]
head(data, 5)

# Check for missing values
colSums(is.na(data))

# Remove 'Embarked' column
data <- data[, !names(data) %in% 'Embarked']

# Encode 'Sex' column
data$Sex <- as.numeric(factor(data$Sex))

# Split data into training and testing sets
set.seed(0)
train_indices <- createDataPartition(data$Survived, p = 0.8, list = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Check lengths
length(train_data)
length(test_data)

# Define features and target variable
x_train <- train_data[, !(names(train_data) %in% 'Survived')]
y_train <- train_data$Survived
x_test <- test_data[, !(names(test_data) %in% 'Survived')]
y_test <- test_data$Survived

# Create and train K-Nearest Neighbors model
library(class)
model <- knn(train = x_train, test = x_test, cl = y_train, k = 3)

# Predict using the model
y_pred <- as.numeric(model)

# Display predictions and actual values
y_pred
y_test

# Calculate accuracy
accuracy <- sum(y_pred == y_test) / length(y_test) * 100
accuracy