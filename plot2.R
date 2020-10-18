plot2 <- function(){
   
   # Load the dataset into a dataframe and extract only the data for the 1st
   # and 2nd of February 2007
   
   library(chron)
   df <- read.table('household_power_consumption.txt',header=TRUE,sep=";")
   df$Date <- dates(df$Date,format="d/m/y")
   df$DateTime <- strptime(paste(df$Date,df$Time),format="%m/%d/%Y%H:%M:%S")
   df <- subset(df,Date == dates("02/01/07") | Date == dates("02/02/07"))
 
   # Convert data to numeric format
   df$Global_active_power <- as.numeric(df$Global_active_power)
   
   # Create plot2
   with(df,plot(DateTime,Global_active_power,type="l",xlab='',
        ylab='Global Active Power (kilowatts)'))
   
   # Copy plot2 to a PNG
   file = "ExData_Plotting1/plot2.png"
   dev.copy(png, file = file,  bg = "white")
   dev.off() 
     
}