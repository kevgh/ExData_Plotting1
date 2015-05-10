## this function downloads, unzips, and reads the data file, subsets based on
## the two dates for the assignment and returns a data frame
get_energy_data <- function()
{
    fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    if(!file.exists("./data")) {
        dir.create("./data")
    }
    data_file_name <- "./data/household_power_consumption.txt"
    if(!file.exists(data_file_name)) {
        download.file(fileURL, "./data/household_power_consumption.zip")
        unzip("./data/household_power_consumption.zip", exdir="./data")
    }

    if (! file.exists(data_file_name)) {
        stop("Unable to find file")
    } else {
        print("Found the data file, beginning to read ...")
        DF <- read.table(data_file_name, sep = ";", na.strings = c("?"),
                         header = TRUE, colClasses = "character")
        # subset based on the days for the assignment
        subDF <- subset(DF, DF$Date %in% c('2/2/2007', '1/2/2007'))
    }
    return(subDF)
}

convert_dt <- function(d, t) {
    as.numeric(strptime(paste(d, " ", t), format = "%d/%m/%Y %H:%M:%S"))
}
