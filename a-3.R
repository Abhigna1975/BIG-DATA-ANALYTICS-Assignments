# This script performs various operations on a demographic dataset:
# 1. Checks if the 'dplyr' package is loaded and unloads it if necessary.
# 2. Installs and loads the 'dplyr' package if not already installed.
# 3. Reads a CSV file containing demographic data.
# 4. Shows the data for France if the 'Country.Name' column exists.
# 5. Filters and prints countries with birth rates > 20 and High income if the 'Birth.rate' and 'Income.Group' columns exist.
# 6. Prints the data of the country with the highest internet users (Iceland) if the 'Internet.users' column exists.
# 7. Calculates and prints the average birth rate if the 'Birth.rate' column exists.
# 8. Calculates and prints the standard deviation of birth rates if the 'Birth.rate' column exists.
# 9. Filters and prints countries whose birth rate is two standard deviations above the mean if the 'Birth.rate' column exists.
# 10. Calculates and prints the interquartile range (IQR) of birth rates if the 'Birth.rate' column exists.

# Check if 'dplyr' is loaded and unload it if necessary
if ("dplyr" %in% search()) {
  detach("package:dplyr", unload=TRUE)
}

# Install and load necessary libraries
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
  library(dplyr)
}

# Read the CSV file
file_path <- "C:/Users/HP/OneDrive/Desktop/bigdata-assignments/Demographics.csv"  # Update this with the correct file path
if (!file.exists(file_path)) {
  stop("File 'demographics.csv' not found. Please provide the correct file path.")
} else {
  demographics <- read.csv(file_path)
}

# Show the data of France if 'Country.Name' column exists
if ("Country.Name" %in% colnames(demographics)) {
  france_data <- subset(demographics, Country.Name == "France")
  print(france_data)
} else {
  print("Column 'Country.Name' not found in the dataset.")
}

# Show the countries with birthrate > 20 and High income if 'Birth.rate' and 'Income.Group' columns exist
if ("Birth.rate" %in% colnames(demographics) & "Income.Group" %in% colnames(demographics)) {
  high_birthrate_high_income <- filter(demographics, Birth.rate > 20 & Income.Group == "High income")
  print(high_birthrate_high_income)
} else {
  print("Columns 'Birth.rate' and/or 'Income.Group' not found in the dataset.")
}

# Show the data of the country with the highest internet users (Iceland) if 'Internet.users' column exists
if ("Internet.users" %in% colnames(demographics)) {
  iceland_data <- demographics[which.max(demographics$Internet.users), ]
  print(iceland_data)
} else {
  print("Column 'Internet.users' not found in the dataset.")
}

# Average Birthrate if 'Birth.rate' column exists
if ("Birth.rate" %in% colnames(demographics)) {
  avg_birthrate <- mean(demographics$Birth.rate)
  print(avg_birthrate)
} else {
  print("Column 'Birth.rate' not found in the dataset.")
}

# Standard Deviation of Birthrate if 'Birth.rate' column exists
if ("Birth.rate" %in% colnames(demographics)) {
  std_dev_birthrate <- sd(demographics$Birth.rate)
  print(std_dev_birthrate)
} else {
  print("Column 'Birth.rate' not found in the dataset.")
}

# Countries whose birth rate is two SDs above the mean if 'Birth.rate' column exists
if ("Birth.rate" %in% colnames(demographics)) {
  high_birthrate_countries <- filter(demographics, Birth.rate > (avg_birthrate + 2 * std_dev_birthrate))
  print(high_birthrate_countries)
} else {
  print("Column 'Birth.rate' not found in the dataset.")
}

# IQR of Birthrate if 'Birth.rate' column exists
if ("Birth.rate" %in% colnames(demographics)) {
  birthrate_iqr <- IQR(demographics$Birth.rate)
  print(birthrate_iqr)
} else {
  print("Column 'Birth.rate' not found in the dataset.")
}
