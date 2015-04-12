plot2 <- function() {
    df <- getdata2()
    png(file="plot2.png")
    plot(df$DateTime, df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", main="", type="l")
    dev.off()
}
getdata2 <- function() {
    df <- fread("./household_power_consumption.txt", skip="1/2/2007",nrows=2880,colClass="character")
    colNames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    setnames(df, colNames)
    df$Date <- as.IDate(df$Date, format = "%d/%m/%Y")
    df$Time <- as.ITime(df$Time, format ="%H:%M:%S")
    df$DateTime <- as.POSIXct(df$Date) + as.ITime(df$Time)
    df$Global_active_power <- as.numeric(df$Global_active_power)
    return(df)
}
