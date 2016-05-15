# Read data
dataPower <- read.table("household_power_consumption.txt", sep = ";",header = TRUE);

# Remove all rows with date other than 2007-02-01 and 2007-02-02 and check for missing values
reducedDataPower <- dataPower[dataPower$Date == "1/2/2007" | dataPower$Date == "2/2/2007",]
if(any("?"==reducedDataPower)){
  stop("There are undefined values in the data");
}

# Plot 1
par(mfrow=c(1,1));
reducedDataPower$Global_active_power <- as.numeric(paste(reducedDataPower$Global_active_power));
hist(as.numeric(paste(reducedDataPower$Global_active_power)), 
     col = "red", main="Gloval Active Power", xlab = "Gloval Active Power (kilowatts)");
# Save plot to png file
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()