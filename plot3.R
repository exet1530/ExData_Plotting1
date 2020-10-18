plot3 <- function(){
   
   # Load the dataset into a dataframe and extract only the data for the 1st
   # and 2nd of February 2007
   
   library(chron)
   df <- read.table('household_power_consumption.txt',header=TRUE,sep=";")
   df$Date <- dates(df$Date,format="d/m/y")
   df$DateTime <- strptime(paste(df$Date,df$Time),format="%m/%d/%Y%H:%M:%S")
   df <- subset(df,Date == dates("02/01/07") | Date == dates("02/02/07"))
   
   # Convert data to numeric format
   df$Global_active_power <- as.numeric(df$Global_active_power)
   
   # Set PNG device
   file = "ExData_Plotting1/plot3.png"
   png(filename=file,bg="white")
   # Create plot3
   with(df,plot(DateTime,Sub_metering_1,type='l',xlab='',
                ylab='Energy  sub metering'))
   with(df,lines(DateTime,Sub_metering_2,col='red'))
   with(df,lines(DateTime,Sub_metering_3,col='blue'))
   legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
          col=c('black','red','blue'),lty=c(1,1,1))
 
   # Write PNG
   dev.off()
     
}