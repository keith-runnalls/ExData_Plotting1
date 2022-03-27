#===============================================================================
# Load data and generate plot4.png
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
# Plot 2x2 panel

# Verify parameters by first plotting to screen
par(mfrow = c(2, 2))

# top left
plot(x = feb_data$date_time,
     y = feb_data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = 'l')

#top right
plot(x = feb_data$date_time,
     y = feb_data$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = 'l')

#bottom left
plot(x = feb_data$date_time,
     y = feb_data$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = 'l')
lines(x = feb_data$date_time,
      y = feb_data$Sub_metering_2,
      col = "red")
lines(x = feb_data$date_time,
      y = feb_data$Sub_metering_3,
      col = "blue")
legend("topright",
       bty = "n",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#bottom right
plot(x = feb_data$date_time,
     y = feb_data$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = 'l')


#===============================================================================
# Open png device and plot to file
png(filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px")

par(mfrow = c(2, 2))

# top left
plot(x = feb_data$date_time,
     y = feb_data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = 'l')

#top right
plot(x = feb_data$date_time,
     y = feb_data$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = 'l')

#bottom left
plot(x = feb_data$date_time,
     y = feb_data$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = 'l')
lines(x = feb_data$date_time,
      y = feb_data$Sub_metering_2,
      col = "red")
lines(x = feb_data$date_time,
      y = feb_data$Sub_metering_3,
      col = "blue")
legend("topright",
       bty = "n",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#bottom right
plot(x = feb_data$date_time,
     y = feb_data$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = 'l')

dev.off()
