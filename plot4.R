source("read_data.R")

## Create a plot of voltage vs datetime per example
plot_voltage <- function(energy_data)
{
  date_times <- mapply(convert_dt, energy_data$Date, energy_data$Time)
  plot(date_times,
       as.numeric(energy_data[, "Voltage"]),
       type = "l", ylab = "Voltage", xlab="datetime",
       axes = FALSE, frame.plot = TRUE)
  axis(side = 1, labels = c("Thu", "Fri", "Sat"),
       at = c(convert_dt("1/2/2007", "0:0:0"),
              convert_dt("2/2/2007", "0:0:0"),
              convert_dt("3/2/2007", "0:0:0")))
  axis(side = 2)
}

## Create a plot of global reactive power vs datetime per example
plot_reactive_power <- function(energy_data)
{
  date_times <- mapply(convert_dt, energy_data$Date, energy_data$Time)
  plot(date_times,
       as.numeric(energy_data[, "Global_reactive_power"]),
       type = "l", ylab = "Global_reactive_power", xlab="datetime",
       axes = FALSE, frame.plot = TRUE)
  axis(side = 1, labels = c("Thu", "Fri", "Sat"),
       at = c(convert_dt("1/2/2007", "0:0:0"),
              convert_dt("2/2/2007", "0:0:0"),
              convert_dt("3/2/2007", "0:0:0")))
  axis(side = 2)
}

par(mfrow = c(2, 2))
ed <- get_energy_data()
png(filename = "plot4.png")
#{
    plot_active_power(ed)
    plot_voltage(ed)
    plot_sub_metering(ed, FALSE)
    plot_reactive_power(ed)
#}
dev.off()
