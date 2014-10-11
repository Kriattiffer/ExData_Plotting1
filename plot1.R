file = read.table("D:\\big_data\\household_power_consumption.txt",sep = ';', header = TRUE, comment.char="")
slice = file[file[,1] == '1/2/2007' | file[,1] == '2/2/2007',]
png('rplot.png')
hist(as.numeric(as.character(slice$Global_active_power)), col = 'red', xlab = 'Global active power (kilowatts)', main = 'Global active power')

dev.off()