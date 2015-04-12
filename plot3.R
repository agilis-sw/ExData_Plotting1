plot3 <- function() {
    df <- getdata3()
    png(file="plot3.png")
    with(df, plot(DateTime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="l"))
    with(df, lines(DateTime, Sub_metering_2, col="red"))
    with(df, lines(DateTime, Sub_metering_3, col="blue"))
    legend("topright", lty="solid", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
}
getdata3 <- function() {
    df <- fread("./household_power_consumption.txt", skip="1/2/2007",nrows=2880,colClass="character")
    colNames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    setnames(df, colNames)
    df$Date <- as.IDate(df$Date, format = "%d/%m/%Y")
    df$Time <- as.ITime(df$Time, format ="%H:%M:%S")
    df$DateTime <- as.POSIXct(df$Date) + as.ITime(df$Time)
    df$Global_active_power <- as.numeric(df$Global_active_power)
    df$Sub_metering_1 = as.numeric(df$Sub_metering_1)
    df$Sub_metering_2 = as.numeric(df$Sub_metering_2)
    df$Sub_metering_3 = as.numeric(df$Sub_metering_3)
    return(df)
}
