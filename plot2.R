# Read data
dataPower <- read.table("household_power_consumption.txt", sep = ";",header = TRUE);

# Remove all rows with date other than 2007-02-01 and 2007-02-02 and check for missing values
reducedDataPower <- dataPower[dataPower$Date == "1/2/2007" | dataPower$Date == "2/2/2007",]
if(any("?"==reducedDataPower)){
  stop("There are undefined values in the data");
}

# Plot 2
par(mfrow=c(1,1));
reducedDataPower$Global_active_power <- as.numeric(paste(reducedDataPower$Global_active_power));
# Determine indices for labelling x axis 
firstIndex <- 1;
secondIndex <- match("2/2/2007",reducedDataPower$Date);
thirdIndex <- length(reducedDataPower$Date);
# Do the actual plot
plot(reducedDataPower$Global_active_power,type = "l",
     ylab = "Gloval Active Power (kilowatts)",xaxt="n",xlab="");
axis(side = 1, at = c(firstIndex,secondIndex,thirdIndex),
     labels = c("Thu","Fri","Sat"))
# Save plot to png file
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()