plot4 <- function() {
        ##Read the data from just the dates we will be using
        tab <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", as.is = c(1,2), nrows = 2880, skip = 66637)
        ##Read the header
        header <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        ##Assign the header to the table with the proper data
        colnames(tab) <- colnames(header)
        ##Create a new column with date and time in the appropriate class
        tab$DateTime <- as.POSIXct(paste(tab$Date,tab$Time), format="%d/%m/%Y %H:%M:%S")
        ##Set up the device for the plot to be made in
        png(filename = "plot4.png", width = 480, height = 480)
        ##Organize the plot in 2 rows and 2 columns
        par(mfrow = c(2, 2))
        ##Set up the plot in position [1,1]
        plot(tab$DateTime, tab$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
        ##Set up the plot in position [1,2]
        plot(tab$DateTime, tab$Voltage, type="l", xlab = "datetime", ylab="Voltage")
        ##Set up the plot in position [2,1]
        plot(tab$DateTime, tab$Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
        lines(tab$DateTime, tab$Sub_metering_1, col = "black")
        lines(tab$DateTime, tab$Sub_metering_2, col = "red")
        lines(tab$DateTime, tab$Sub_metering_3, col = "blue")
        legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ##Set up the plot in position [2,2]
        plot(tab$DateTime, tab$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
        ##Close the PNG device
        dev.off()
}