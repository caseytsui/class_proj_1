# Exploratory Data Analysis Course Project 1 - Plot 4
# By Casey Tsui
# Format: R version 3.0.3 (2014-03-06)
# Last updated: 6/8/14


# SET WORKING DIRECTORY ########################################################

root1 <- "/Users/caseytsui/Documents/personal/coursera/"
root2 <- "04_exploratory_data_analysis/class_projects/class_proj_1/"
dir <- paste(root1, root2, sep="")
setwd(dir)


# READ IN DATA #################################################################

data <- read.table("./data/household_power_consumption.txt",
                    header=TRUE, sep=";", na.strings=c("NA", "?"))


# CLEAN DATA ###################################################################

names(data) <- tolower(names(data))

data$date <- as.Date(data$date, "%d/%m/%Y")
data$time <- strptime(paste(data$date, data$time, sep=","), "%Y-%m-%d,%H:%M:%S")

data_sub <- subset(data, date == as.Date("2007-02-01") |
                   date == as.Date("2007-02-02"))


# PLOTS ########################################################################

# Open png driver
png("plot4.png")

# Plot 4
par(mfrow=c(2, 2))

# Subplot 1
with(data_sub, {
        plot(time, global_active_power, pch=NA_integer_, xlab="",
             ylab="Global Active Power")
        lines(time, global_active_power)
})

# Subplot 2
with(data_sub, {
        plot(time, voltage, pch=NA_integer_, xlab="datetime",
             ylab="Voltage")
        lines(time, voltage)
})

# Subplot 3
with(data_sub, {
        plot(time, sub_metering_1, pch=NA_integer_, xlab="",
             ylab="Energy sub metering")
        lines(time, sub_metering_1, col="black")
        lines(time, sub_metering_2, col="red")
        lines(time, sub_metering_3, col="blue")
        legend("topright", lty=1, bty="n", col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Subplot 4
with(data_sub, {
        plot(time, global_reactive_power, pch=NA_integer_,
             xlab="datetime", ylab="Global_reactive_power")
        lines(time, global_reactive_power)
})

# Close png driver
dev.off()


