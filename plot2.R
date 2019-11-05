plot2 <- function() {
        ##Read the data from just the dates we will be using
        tab <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", as.is = c(1,2), nrows = 2880, skip = 66637)
        ##Read the header
        header <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        ##Assign the header to the table with the proper data
        colnames(tab) <- colnames(header)
        ##Create a new column with date and time in the appropriate class
        tab$DateTime <- as.POSIXct(paste(tab$Date,tab$Time), format="%d/%m/%Y %H:%M:%S")
        ##Set up the device for the plot to be made in
        png(filename = "plot2.png", width = 480, height = 480)
        ##Plot with the appropriate labels and titles
        plot(tab$DateTime, tab$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
        ##Close the PNG device
        dev.off()
}