# Load results
load("gen/analysis/output/model_results.RData")

# Load in additional package to export to latex table
require(stargazer) 

# Export to latex table (omits f-stat since messes up table)
stargazer(m1,m2,out="gen/paper/output/table1.tex",
            title = "Example results", label = "tab:example",
            omit.stat=c("f")) 






# Load ggplot2 if not already loaded
library(ggplot2)

# Create a scatter plot of relationship between runtime and average rating
ggplot(data_cleaned, aes(x = runtimeMinutes, y = averageRating)) +
  geom_point() +
  labs(x = "Runtime (minutes)", y = "Average Rating") +
  ggtitle("Scatter Plot of Runtime vs. Average Rating")

#Scatterplot of runtime over the years (did it increase?)
ggplot(data_cleaned, aes(x = year, y = runtimeMinutes)) +
  geom_point() +
  labs(x = "Year", y = "Runtime (minutes)") +
  ggtitle("Scatter Plot of Runtime vs. Year")

#Scatterplot of movie count by year
ggplot(data_cleaned, aes(x = year)) +
  geom_bar() +
  labs(x = "Year", y = "Count of Movies") +
  ggtitle("Bar Chart of Movie Count by Year")

# Line plot of average rating over time x
ggplot(data_cleaned, aes(x = year, y = averageRating)) +
  geom_line() +
  labs(x = "Year", y = "Average Rating") +
  ggtitle("Line Plot of Average Rating Over Time")

ggplot(data_cleaned, aes(x = runtimeMinutes)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  labs(x = "Runtime (minutes)", y = "Frequency") +
  ggtitle("Histogram of Runtime Distribution")


# Create a line plot with smoothed line for average rating over time
ggplot(data_cleaned, aes(x = year, y = averageRating)) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  geom_point() +
  labs(x = "Year", y = "Average Rating") +
  ggtitle("Average Rating Over Time with Smoothed Line")

