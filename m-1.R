# Load necessary library
library(ggplot2)

# Load the data from a CSV file
data <- read.csv(file.choose())

# Display the first few rows of the data to understand its structure
head(data)

# Perform the linear regression
model <- lm(Salary ~ YearsExperience, data = data)

# Display the summary of the regression model
summary(model)

# Visualize the results
# Create a scatter plot of the data
ggplot(data, aes(x = YearsExperience, y = Salary)) +
  geom_point() +  # Add points
  geom_smooth(method = "lm", col = "blue") +  # Add the regression line
  labs(title = "Salary vs. Years of Experience",
       x = "Years of Experience",
       y = "Salary")
