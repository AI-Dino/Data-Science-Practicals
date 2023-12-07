# Load necessary libraries
install.packages("glmnet")

library(ggplot2)
library(dplyr)

# Load the Titanic datase
data <- Titanic_Dataset

# Display the first 5 rows of the dataset
head(data, 5)

# Create a countplot
ggplot(data, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Class") +
  xlab("Class") +
  ylab("Count")

# Display information about the dataset
str(data)

# Fill missing Age values with the mean age
mean_age <- round(mean(data$Age, na.rm = TRUE), 2)
data$Age[is.na(data$Age)] <- mean_age

# Display information after filling missing Age values
str(data)

# Drop unnecessary columns
data <- data %>% select(-PassengerId, -Name, -Cabin, -Ticket, -Fare)

# Check for missing values
colSums(is.na(data))

# Drop the 'Embarked' column
data <- data %>% select(-Embarked)

# Convert 'Sex' to numeric using label encoding
data$Sex <- as.numeric(factor(data$Sex))

# Split the data into training and testing sets
set.seed(0)  # Set random seed for reproducibility
split_indices <- sample(1:nrow(data), 0.8 * nrow(data))
train_data <- data[split_indices, ]
test_data <- data[-split_indices, ]

# Check the lengths of the training and testing sets
nrow(train_data)
nrow(test_data)

# Define the predictors and response variable for training and testing
x_train <- train_data[, -1]
y_train <- train_data$Survived
x_test <- test_data[, -1]
y_test <- test_data$Survived

# Load the logistic regression library
library(glmnet)

# Create and train the logistic regression model
model <- glm(Survived ~ ., data = train_data, family = binomial)

# Make predictions on the test data
y_pred <- predict(model, newdata = test_data, type = "response")

# Convert probabilities to binary predictions
y_pred_class <- ifelse(y_pred > 0.5, 1, 0)

# Calculate accuracy
accuracy <- sum(y_pred_class == y_test) / length(y_test) * 100
accuracy

# Make a single prediction
new_data_point <- data.frame(Pclass = 1, Sex = 0, Age = 31, SibSp = 1, Parch = 0)
prediction <- predict(model, newdata = new_data_point, type = "response")
prediction
