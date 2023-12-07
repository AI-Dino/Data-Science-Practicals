titanic = Titanic_Dataset

# Load the Titanic dataset
# Extract the "Age" variable and remove missing values
age_data <- na.omit(titanic$Age)

# Create a histogram of passenger ages
hist(age_data, 
     main = "Histogram of Passenger Ages",
     xlab = "Age",
     ylab = "Frequency",
     col = "blue",
     border = "black")

# Calculate mean and standard deviation of passenger ages
mean_age <- mean(age_data)
sd_age <- sd(age_data)

# Generate x-values for the normal distribution curve
x_values <- seq(min(age_data), max(age_data), length = 100)

# Calculate the corresponding y-values using dnorm()
y_values <- dnorm(x_values, mean = mean_age, sd = sd_age)

# Create a new plot for the normal distribution curve
plot(x_values, y_values, type = "l", col = "red", lwd = 2, ylim = c(0, max(y_values)))

# Add a legend to the plot
legend("topright", legend = "Normal Distribution", col = "red", lty = 1, cex = 0.8)

library(BSDA)
library(stats)
# Given data
x <- c(63, 63, 64, 65, 66, 69, 69, 70, 70, 71)
n <- 10
population_mean <- 65

# Perform a one-sample t-test
t_test_result <- t.test(x, mu = population_mean)

# Print the t-test result
cat("T-Test Result:\n")
cat("T-Score:", t_test_result$statistic, "\n")
cat("Degrees of Freedom:", t_test_result$parameter, "\n")
sample_mean <- mean(x)
standard_error <- sd(x) / sqrt(n)
z_score <- (sample_mean - population_mean) / standard_error

# Perform a one-sample Z-test
z_test_result <- z.test(x, mu = population_mean, sigma.x = 3.12)

# Print the Z-score and Z-Test result
cat("\nZ-Score:", z_score, "\n")

