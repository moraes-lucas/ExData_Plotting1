plot1 <- function() {
        ##Read the data from just the dates we will be using
        tab <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 2880, skip = 66637)
        ##Read the header
        header <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        ##Assign the header to the table with the proper data
        colnames(tab) <- colnames(header)
        ##Set up the device for the plot to be made in
        png(filename = "plot1.png", width = 480, height = 480)
        ##Plot with the appropriate colour and titles
        hist(tab$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        ##Close the PNG device
        dev.off()
}