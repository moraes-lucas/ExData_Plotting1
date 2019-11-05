plot3 <- function() {
        ##Read the data from just the dates we will be using
        tab <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", as.is = c(1,2), nrows = 2880, skip = 66637)
        ##Read the header
        header <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        ##Assign the header to the table with the proper data
        colnames(tab) <- colnames(header)
        ##Create a new column with date and time in the appropriate class
        tab$DateTime <- as.POSIXct(paste(tab$Date,tab$Time), format="%d/%m/%Y %H:%M:%S")
        ##Set up the device for the plot to be made in
        png(filename = "plot3.png", width = 480, height = 480)
        ##Set up the plot and does not fill it with data
        plot(tab$DateTime, tab$Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
        ##Plot the lines for each specific column with a different colour
        lines(tab$DateTime, tab$Sub_metering_1, col = "black")
        lines(tab$DateTime, tab$Sub_metering_2, col = "red")
        lines(tab$DateTime, tab$Sub_metering_3, col = "blue")
        ##Create a legend
        legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ##Close the PNG device
        dev.off()
}