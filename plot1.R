#===============================================================================
# Load data and generate plot1.png
#===============================================================================

library(readr)
library(dplyr)

#===============================================================================
# Download and unzip data set into data directory if it isn't there

source("./download_unzip.R")


#===============================================================================
# Import data into R and convert Date format

power_data <- read_delim("data/household_power_consumption.txt", 
                         delim = ";",
                         escape_double = FALSE,
                         na = "?", 
                         trim_ws = TRUE)

power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")


#===============================================================================
# Subset data to 2007-02-01 & 2007-02-02

feb_data <- power_data %>%
              filter(Date == "2007-02-01" | Date == "2007-02-02")


#===============================================================================
# Plot histogram of global active power

# Verify parameters by first plotting to screen
hist(feb_data$Global_active_power,
     col ="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Open png device and re-plot histogram to file
png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")

hist(feb_data$Global_active_power,
     col ="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
