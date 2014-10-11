file = read.table("D:\\big_data\\household_power_consumption.txt",sep = ';', header = TRUE, comment.char="")
slice = file[file[,1] == '1/2/2007' | file[,1] == '2/2/2007',]
time = strptime(paste(slice$Date, slice$Time, sep = '/'), format="%d/%m/%Y/%H:%M:%S")
png("rplot4.png")
Sys.setlocale("LC_TIME", 'English') 
par(mfrow = c(2,2))
par(mar = c(5,4,3,2))

##1
data <- as.numeric(as.character(slice$Global_active_power))
plot(time, data, type = 'l', ylab = 'Global active power (kilowatts)', xlab = '')
##2
data <- as.numeric(as.character(slice$Voltage))
plot(time, data, type = 'l', ylab = 'Voltage', xlab = 'datetime')
##3
data1 <- as.numeric(as.character(slice$Sub_metering_1))
data2 <- as.numeric(as.character(slice$Sub_metering_2))
data3 <- as.numeric(as.character(slice$Sub_metering_3))
yl = range(c(data1, data2, data3))
plot(time, data1, ylim = yl, type = 'l', ylab = 'Energy sub metering', xlab = '')
par(new = T)
plot(time, data2, ylim = yl, axes = FALSE,  type = 'l', ylab = NA, xlab = NA, col = 'red')
par(new = T)
plot(time, data3, ylim = yl, axes = FALSE, type = 'l', ylab = '', xlab = '', col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lty=1, bty='n', cex  = 0.8, legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
##4
data <- as.numeric(as.character(slice$Global_reactive_power))
plot(time, data, type = 'l',  ylab = 'Voltage', xlab = 'datetime')

dev.off()