file = read.table("D:\\big_data\\household_power_consumption.txt",sep = ';', header = TRUE, comment.char="")
slice = file[file[,1] == '1/2/2007' | file[,1] == '2/2/2007',]
time = strptime(paste(slice$Date, slice$Time, sep = '/'), format="%d/%m/%Y/%H:%M:%S")
data <- as.numeric(as.character(slice$Global_active_power))
png('rplot2.png')
Sys.setlocale("LC_TIME", 'English') 
plot(time, data, type = 'l', ylab = 'Global active power (kilowatts)', xlab = '')

dev.off()