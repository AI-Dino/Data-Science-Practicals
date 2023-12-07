# Load the ChickWeight dataset
data(ChickWeight)

# Subset the data to get the final weights
final_weight_data <- ChickWeight[ChickWeight$Time == max(ChickWeight$Time), ]

# Calculate the mean of final weights for each diet group
mean_weight <- tapply(final_weight_data$weight, final_weight_data$Diet, mean)

# Convert 'Diet' to a factor for ANOVA
final_weight_data$Diet <- factor(final_weight_data$Diet)

# Perform one-way ANOVA
anova_result <- aov(weight ~ Diet, data = final_weight_data)

# Post hoc test (Tukey's HSD)
tukey_result <- TukeyHSD(anova_result)

# Equality of variance (Levene's test)
library(car)
levene_test <- leveneTest(weight ~ Diet, data = final_weight_data)
  print(levene_test)

# Create a boxplot
boxplot(weight ~ Diet, data = final_weight_data, main = "Boxplot of Final Weight by Diet", xlab = "Diet", ylab = "Final Weight")

# Check the p-value from ANOVA
p_value <- summary(anova_result)[[1]][["Pr(>F)"]][1]

# Define the significance level (alpha)
alpha <- 0.05

# Print the decision based on the p-value
if (p_value < alpha) {
  cat("Reject the null hypothesis. There is a significant difference in means.\n")
} else {
  cat("Accept the null hypothesis. There is no significant difference in means.\n")
}

