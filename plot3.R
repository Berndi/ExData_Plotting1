# Read data
dataPower <- read.table("household_power_consumption.txt", sep = ";",header = TRUE);

# Remove all rows with date other than 2007-02-01 and 2007-02-02 and check for missing values
reducedDataPower <- dataPower[dataPower$Date == "1/2/2007" | dataPower$Date == "2/2/2007",]
if(any("?"==reducedDataPower)){
  stop("There are undefined values in the data");
}

# Plot 3
par(mfrow=c(1,1));
reducedDataPower$Sub_metering_1 <- as.numeric(paste(reducedDataPower$Sub_metering_1));
reducedDataPower$Sub_metering_2 <- as.numeric(paste(reducedDataPower$Sub_metering_2));
reducedDataPower$Sub_metering_3 <- as.numeric(paste(reducedDataPower$Sub_metering_3));
# Determine indices for labelling x axis
firstIndex <- 1;
secondIndex <- match("2/2/2007",reducedDataPower$Date);
thirdIndex <- length(reducedDataPower$Date);
# Do the actual plot
plot(reducedDataPower$Sub_metering_1,type="l",xaxt="n",xlab="",ylab = "Energy sub metering");
lines(reducedDataPower$Sub_metering_2,col = "red");
lines(reducedDataPower$Sub_metering_3,col = "purple");
legend("topright", legend = names(reducedDataPower)[7:9],
       col = c("black","red","purple"), lty = rep(1,3));
axis(side = 1, at = c(firstIndex,secondIndex,thirdIndex),
     labels = c("Thu","Fri","Sat"))
# Save plot to png file
dev.copy(png,"plot3.png",width = 480, height = 480)
dev.off()