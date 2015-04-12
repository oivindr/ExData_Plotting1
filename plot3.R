plot3 <- function(){
        # Read the data from Working Directory
        hp <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

        # Add DateTime variable combined from Date and Time
        hp$DateTime <- strptime(paste(hp$Date,hp$Time),"%d/%m/%Y %H:%M:%S")

        # SUbset data with relevant dates
        startdate <- strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
        stopdate <- strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")
        hp_rd <- hp[hp$DateTime >= startdate & hp$DateTime <= stopdate,]

        #set graphic device
        png(filename = "plot3.png",
            width = 480, height = 480, units = "px",
            bg = "white")
        
        #set Local to get timeaxis values in english
        Sys.setlocale("LC_TIME", "English")
        
        #do the plot
        plot(hp_rd$DateTime,hp_rd$Sub_metering_1,
             type = "l",
             ylab="Energy sub metering",
             xlab="")
        lines(hp_rd$DateTime,hp_rd$Sub_metering_2,col="red")
        lines(hp_rd$DateTime,hp_rd$Sub_metering_3,col="blue")
        legend("topright",
               lwd=1,
               col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

        # close the graphic device
        dev.off()
}