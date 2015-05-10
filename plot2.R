## simple script to create plot1 and a corresponding png file

source("read_data.R")

# create simple plot of active power per example
plot_active_power <- function(energy_data)
{
  plot(mapply(convert_dt, energy_data$Date, energy_data$Time),
       as.numeric(energy_data[, "Global_active_power"]),
       type = "l", ylab = "Global Active Power (kilowatts)", xlab="",
       axes = FALSE, frame.plot = TRUE)
  axis(side = 1, labels = c("Thu", "Fri", "Sat"),
       at = c(convert_dt("1/2/2007", "0:0:0"),
              convert_dt("2/2/2007", "0:0:0"),
              convert_dt("3/2/2007", "0:0:0")))
  axis(side = 2)
}

par(mfrow=c(1, 1))
png(filename = "plot2.png")
plot_active_power(get_energy_data())
dev.off()
