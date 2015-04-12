plot1 <- function(){
        # Read the data from Working Directory
        hp <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

        # Add DateTime variable combined from Date and Time
        hp$DateTime <- strptime(paste(hp$Date,hp$Time),"%d/%m/%Y %H:%M:%S")

        # SUbset data with relevant dates
        startdate <- strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
        stopdate <- strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")
        hp_rd <- hp[hp$DateTime >= startdate & hp$DateTime <= stopdate,]

        #set graphic device
        png(filename = "plot1.png",
            width = 480, height = 480, units = "px",
            bg = "white")
        
        #do the plot
        hist(hp_rd$Global_active_power, 
             xlab="Global Active Power (kilowatts)", 
             col="red",
             main="Global Active Power" )
        
        # close the graphic device
        dev.off()
}