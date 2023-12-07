x=c(10,20,30,40,50,60)
labels=c("Arjan","Abhishek","Abdul","Afaf","Saim","Pranav")
color=c("red","green","blue","orange","purple","yellow")
pie(x,labels,col = color,main="Marks Pie Chart")
legend("topright", labels, cex = 0.8, bty = "n", fill =color )
hist(x,col=color,main="Sample Histogram")
# Sample data
data <- data.frame(Category = c("A", "B", "C", "D"), Value = c(10, 20, 15, 25))

# Bar chart
barplot(data$Value, names.arg = data$Category, col = "skyblue", main = "Bar Chart", ylab = "Values")
# Sample data
x <- 1:10
y <- x^2

# Line plot
plot(x, y, type = "l", col = "blue",  main = "Line Plot", xlab = "X-axis", ylab = "Y-axis")
# Sample data
x <- rnorm(50)
y <- 2 * x + rnorm(50)

# Scatter plot
plot(x, y, col = "red", main = "Scatter Plot", xlab = "X-axis", ylab = "Y-axis")

# Sample data
values <- rnorm(100)

# Box plot
boxplot(values, col = "lightblue", main = "Box Plot", ylab = "Values")

