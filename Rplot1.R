
setwd('C:/Users/Mas Mobiliario SAS/Dropbox/especializacion_coursera')

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = 'data.zip')
unzip('data.zip') 

data_pc = read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
data_pc[data_pc == '?'] = NA
data_pc$Global_active_power = as.numeric(data_pc$Global_active_power)
data_pc$Global_reactive_power = as.numeric(data_pc$Global_reactive_power)
data_pc$Voltage = as.numeric(data_pc$Voltage)
data_pc$Global_intensity = as.numeric(data_pc$Global_intensity)
data_pc$Sub_metering_1 = as.numeric(data_pc$Sub_metering_1)
data_pc$Sub_metering_2 = as.numeric(data_pc$Sub_metering_2)
data_pc$Sub_metering_3 = as.numeric(data_pc$Sub_metering_3)

data_pc$date_time = strptime(paste(data_pc$Date, data_pc$Time), format = '%d/%m/%Y %H:%M:%S')

subset_data = subset(data_pc, date_time>='2007-02-01 00:00:00' & date_time<= '2007-02-02 24:00:00')




png('C:/Users/Mas Mobiliario SAS/datasciencecoursera/exploratory_data_analysis/ExData_Plotting1/figure/plot1.png')
hist(subset_data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (Kilowatts)')
dev.off()



