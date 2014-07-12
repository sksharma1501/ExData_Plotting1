# Exploratory Data Analysis
# Project 1, Plot 3

setwd("C:\\Users\\sksharma\\Documents\\Personal\\Coursera\\ExploratoryDataAnalysis\\Projects\\Project1\\ExData_Plotting1")

# Since we are interested only in two dates (2007-02-01, 2007-02-02), we can skip loading the other data
# But first figure out how many lines to skip
first_sample <- read.delim("household_power_consumption.txt", sep=";", nrows=1, na.strings="?")
dtime <- paste(first_sample$Date, first_sample$Time, sep=" ")
first_sample.time <- strptime(dtime, format="%d/%m/%Y %H:%M:%S")
interest_sample.first.time <- strptime("01/02/2007 0:0:0", format="%d/%m/%Y %H:%M:%S")
skip_lines <- as.numeric(difftime(interest_sample.first.time, first_sample.time, units="mins"))
#skip_lines

# Now figure out how many lines to read
interest_sample.last.time <- strptime("03/02/2007 0:0:0", format="%d/%m/%Y %H:%M:%S")
read_lines <- as.numeric(difftime(interest_sample.last.time, interest_sample.first.time, units="mins"))
#read_lines

# Now read the dataset
dframe <- read.delim("household_power_consumption.txt", sep=";", skip = skip_lines, nrows=read_lines, na.strings="?")
names(dframe) <- names(first_sample)
dframe$Day <- strptime(paste(dframe$Date, dframe$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
head(dframe)   # Verify data
tail(dframe)   # Verify data

# Line plot of Energy sub metering
png(filename="plot3.png", height=480, width=480)
plot(dframe$Day, dframe$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l")
points(dframe$Day, dframe$Sub_metering_2, type="l", col="red")
points(dframe$Day, dframe$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1)
dev.off()
