# Create a data frame with your historical data
data <- data.frame(
  Year = c(2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023),
  Students = c(50, 60, 75, 85, 100, 125, 150, 175, 200, 300),
  Faculty = c(15, 18, 24, 27, 32, 35, 39, 45, 50, 55)
)
# Calculate growth rates for faculty and students
data$Faculty_Growth_Rate <- c(NA, diff(data$Faculty) / data$Faculty[-length(data$Faculty)]) * 100
data$Student_Growth_Rate <- c(NA, diff(data$Students) / data$Students[-length(data$Students)]) * 100
# Calculate average growth rates
avg_faculty_growth_rate <- mean(data$Faculty_Growth_Rate, na.rm = TRUE)
avg_student_growth_rate <- mean(data$Student_Growth_Rate, na.rm = TRUE)
# Your existing code for calculating growth rates and average growth rates
# ... (the code you provided)

# Additional code to estimate faculty demand for 2024 with 500 students
expected_students_2024 <- 500  # Number of students expected in 2024

# Estimate faculty demand for 2024 using the average growth rate
estimated_faculty_2024 <- tail(data$Faculty, 1) * (1 + (avg_faculty_growth_rate / 100)) * (expected_students_2024 / tail(data$Students, 1))

# Print the estimated faculty demand for 2024
cat("Estimated Faculty Demand for 2024 with 500 students: ", round(estimated_faculty_2024, 2), "\n")

#Ratio Analysis 
current_faculty_total <- sum(data$Faculty)
current_student_total <- sum(data$Students)
current_ratio <- tail(current_faculty_total / current_student_total)
projected_demand_ratio <- tail(current_ratio * 500)


