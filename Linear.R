# Sample data
salary_data <- data.frame(
  YearsExperience = c(1.1, 1.3, 1.5, 2, 2.2, 2.9, 3, 3.2, 3.2, 3.7),
  Salary = c(39343, 46205, 37731, 43525, 39891, 56642, 60150, 54445, 64445, 57189)
)

# Linear Regression and Visualization
lm_plot <- lm(Salary ~ YearsExperience, data = salary_data)

# Plotting using base R
plot(salary_data$YearsExperience, salary_data$Salary, main = "Linear Regression",
     xlab = "Years of Experience", ylab = "Salary")
abline(lm_plot, col = "blue")