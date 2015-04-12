plot1 <- function() {
    df <- getdata()
    png(file="plot1.png")
    hist(df$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    dev.off()
}
getdata <- function() {
    df <- fread("./household_power_consumption.txt", skip="1/2/2007",nrows=2880,colClass="character")
    colNames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    setnames(df, colNames)
    df$Date <- as.IDate(df$Date, format = "%d/%m/%Y")
    df$Time <- as.ITime(df$Time, format ="%H:%M:%S")
    df$DateTime <- as.POSIXct(df$Date) + as.ITime(df$Time)
    df$Global_active_power <- as.numeric(df$Global_active_power)
    return(df)
}
