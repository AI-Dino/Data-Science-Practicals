install.packages("corrplot")
x=c(63,63,64,65,66,69,69,70,70,71)
variance = var(x)
sd = sqrt(variance)
sd
m = mean(x)
m
Salary_Data['YearsExperience']
library("corrplot")
data = cor(Salary_Data)
print(data)
corrplot(data, type = "lower")

ir = Iris
ir = ir[,-6]
head(ir)
ir_data = cor(ir)
print(ir_data)
corrplot(ir_data, method = "circle")

library(tidyverse)
titanic = Titanic_Dataset
titanic$Age <- ifelse(is.na(titanic$Age), median(titanic$Age, na.rm = TRUE), titanic$Age)
most_common_embarked <- mode(titanic$Embarked)
titanic$Embarked[is.na(titanic$Embarked)] <- most_common_embarked
titanic_cleaned <- titanic %>%
  select(-PassengerId, -Name, -Ticket, -Cabin)
titanic_cleaned$Survived <- factor(titanic_cleaned$Survived)
titanic_cleaned$Pclass <- factor(titanic_cleaned$Pclass)
titanic_cleaned$Sex <- factor(titanic_cleaned$Sex)
titanic_cleaned$Embarked <- factor(titanic_cleaned$Embarked)
summary(titanic_cleaned)
write.csv(titanic_cleaned, "titanic_cleaned.csv", row.names = FALSE)

datat = cor(titanic_cleaned)
print(datat)
titanic_cleaned
