plot4 <- function(){
   
   # Load the dataset into a dataframe and extract only the data for the 1st
   # and 2nd of February 2007
   
   library(chron)
   df <- read.table('household_power_consumption.txt',header=TRUE,sep=";")
   df$Date <- dates(df$Date,format="d/m/y")
   df$DateTime <- strptime(paste(df$Date,df$Time),format="%m/%d/%Y%H:%M:%S")
   df <- subset(df,Date == dates("02/01/07") | Date == dates("02/02/07"))
 
   # Set PNG device
   file = "ExData_Plotting1/plot4.png"
   png(filename=file,bg="white")
   
   # Set 2x2 plotting
   par(mfrow=c(2,2))
     
   # Draw plot2 (upper left)
   with(df,plot(DateTime,Global_active_power,type="l",xlab='',
                ylab='Global Active Power'))  
   
   # Draw upper right plot
   with(df,plot(DateTime,Voltage,type="l",xlab="datetime",
                ylab="Voltage"))
   
   # Draw plot3 (lower left)
   with(df,plot(DateTime,Sub_metering_1,type='l',xlab='',
                ylab='Energy  sub metering'))
   with(df,lines(DateTime,Sub_metering_2,col='red'))
   with(df,lines(DateTime,Sub_metering_3,col='blue'))
   legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
          col=c('black','red','blue'),lty=c(1,1,1),bty='n')
   
   # Draw lower right plot
   with(df,plot(DateTime,Global_reactive_power,type="l",xlab="datetime",
        ylab="Global_reactive_power"))
   
   # Write the PNG
   dev.off()
}