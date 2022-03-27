#===============================================================================
# Load data and generate plot2.png
#===============================================================================

library(readr)
library(dplyr)

#===============================================================================
# Download and unzip data set into data directory if it isn't there

source("./download_unzip.R")


#===============================================================================
# Import data into R

power_data <- read_delim("data/household_power_consumption.txt", 
                         delim = ";",
                         escape_double = FALSE,
                         na = "?", 
                         trim_ws = TRUE)


#===============================================================================
# Combine date and time into single variable

power_data <- power_data %>% 
              mutate(date_time = as.POSIXct(paste(Date, Time),
                                            format= "%d/%m/%Y %H:%M:%S"))

#===============================================================================
# Subset data to 2007-02-01 & 2007-02-02

feb_data <- power_data %>%
            filter(Date %in% c("1/2/2007", "2/2/2007"))


#===============================================================================
# Plot time series of Global Active Power

# Verify parameters by first plotting to screen
plot(x = feb_data$date_time,
     y = feb_data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = 'l')


# Open png device and plot to file
png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px")

plot(x = feb_data$date_time,
     y = feb_data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = 'l')

dev.off()
