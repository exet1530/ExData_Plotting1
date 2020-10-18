plot1 <- function(){
 
   # Load the dataset into a dataframe and extract only the data for the 1st
   # and 2nd of February 2007
   
   library(chron)
   df <- read.table('household_power_consumption.txt',header=TRUE,sep=";")
   df$Date <- dates(df$Date,format="d/m/y")
   df$Time <- times(df$Time)
   df <- subset(df,Date == dates("02/01/07") | Date == dates("02/02/07"))
   
   # Convert data to numeric format
   df$Global_active_power <- as.numeric(df$Global_active_power)
   
   # Create plot1
   with(df,hist(Global_active_power,xlab="Global Active Power (kilowatts)",
                col='red',main="Global Active Power"))
   
   # Copy plot1 to a PNG
   file = "ExData_Plotting1/plot1.png"
   dev.copy(png, file = file,  bg = "white")
   dev.off()
}