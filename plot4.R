plot4 <- function() {
    df <- getdata4()
    png(file="plot4.png")
    par(mfrow=c(2,2))
    with (df,
            {
            plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", main="", type="l")
            plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", main="", type="l")
            plot(DateTime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="l")
            lines(DateTime, Sub_metering_2, col="red")
            lines(DateTime, Sub_metering_3, col="blue")
            legend("topright", lty="solid", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
            plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", main="", type="l")
            }
    )
    dev.off()
}
getdata4 <- function() {
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
    df$Voltage = as.numeric(df$Voltage)
    df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
    return(df)
}
