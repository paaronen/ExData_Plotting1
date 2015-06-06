# Coursera/JHU Data Science Exploratory Data Analysis Course Project
# "Individual household electric power consumption Data Set" 
# From U Cal Irvine Machine Learning Repository 

# Downloading data from the Url and checking required R packages
# and install them if not previously present
# ------------------------------------------------------------------------------
# 
# 
if("downloader" %in% rownames(installed.packages()) == FALSE) {install.packages("downloader")};library(downloader)


#############
#############

# Download data an unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


if (!file.exists("data household_power_consumption")) {
  }
download(fileUrl, dest="data/data household_power_consumption.zip", mode="wb") 
unzip ("data/data household_power_consumption.zip")

# read data,missing values are coded as ?
datas<-read.table("household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")
# subset data 
data <- datas[grep("^[12]/2/2007", datas$Date), ] # takes out 01/02/2007 and 02/02/2007

#head(data)
#names(data)


# convert the Date and Time variables to Date/Time classes
# strptime() and as.Date() 

data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$Time <- paste(data$Date, data$Time, sep=" ")
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

# make plot to directory
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off()




