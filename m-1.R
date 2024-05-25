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

#POLYNOMIAL REGRESSION
# Load the ice cream dataset (replace 'ice_cream_data.csv' with the actual filename)
ice_cream_data <- read.csv(file.choose())

# View the structure of the dataset
str(ice_cream_data)

# Fit a polynomial regression model
degree <- 3  # Adjust the degree of the polynomial
model <- lm(`Ice.Cream.Sales..units.` ~ poly(`Temperature...C.`, degree), data = ice_cream_data)

# Summary of the model
summary(model)

# Plot the data and the fitted polynomial curve
plot(ice_cream_data$Temperature...C., ice_cream_data$Ice.Cream.Sales..units., 
     xlab = "Temperature (C)", ylab = "Ice Cream Sales (units)", main = "Polynomial Regression", pch = 16)
lines(sort(ice_cream_data$Temperature...C.), predict(model, data.frame(`Temperature...C.` = sort(ice_cream_data$Temperature...C.))), col = "red", lwd = 2)


#LOGISTIC REGRESSION
library(ggplot2)

# Create a sequence of values for the predictor variable
balance_seq <- seq(min(Default$balance), max(Default$balance), length.out = 100)
income_seq <- seq(min(Default$income), max(Default$income), length.out = 100)

# Generate predicted probabilities for each combination of predictor values
predictions <- predict(model, newdata = data.frame(balance = balance_seq, income = median(Default$income), student = "No"), type = "response")

# Create a data frame with predictor values and predicted probabilities
plot_data <- data.frame(balance = balance_seq, probability = predictions)

# Plot the logistic regression curve
ggplot(Default, aes(x = balance, y = default)) +
  geom_point(aes(color = default), alpha = 0.5) +
  geom_line(data = plot_data, aes(x = balance, y = probability), color = "blue", linewidth = 1) +
  scale_color_manual(values = c("red", "green")) +
  labs(title = "Logistic Regression Curve",
       x = "Balance",
       y = "Probability of Default") +
  theme_minimal()
