#===============================================================================
# Creates a data directory, then downloads and unzips UCI electric power
# consumption data set. Intended to be sourced by other plot generating scripts. #===============================================================================

library(utils)

#===============================================================================
# Create a data directory if one doesn't exist

if(!file.exists("./data")) {dir.create("./data")}


#===============================================================================
# Download and unzip data set if it doesn't exist

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

file_name <- "./data/exdata-data-household_power_consumption.zip"

if(!file.exists(file_name)) {
  download.file(fileURL, destfile = file_name, method = 'curl')
  unzip(file_name, exdir = "./data", unzip = "unzip")
}

