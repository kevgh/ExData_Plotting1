## simple script to create plot3 and a corresponding png file

source("read_data.R")

# create a plot of sub metering 1,2 and 3 per example
plot_sub_metering <- function(energy_data, draw_legend_box)
{
  date_times <- mapply(convert_dt, energy_data$Date, energy_data$Time)
  
  plot(date_times,
       as.numeric(energy_data[, "Sub_metering_1"]),
       type = "l", ylab = "Energy sub metering", xlab="",
       axes = FALSE, frame.plot = TRUE)
  lines(date_times,
        as.numeric(energy_data[, "Sub_metering_2"]),
        col="red")
  lines(date_times,
        as.numeric(energy_data[, "Sub_metering_3"]),
        col="blue")
  axis(side = 1, labels = c("Thu", "Fri", "Sat"),
       at = c(convert_dt("1/2/2007", "0:0:0"),
              convert_dt("2/2/2007", "0:0:0"),
              convert_dt("3/2/2007", "0:0:0")))
  axis(side = 2)
  if(draw_legend_box) {
    bty = "o"
  } else {
    bty = "n"
  }
  legend("topright", pch = "_", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd = c(3, 3, 3), bty = bty)
}

par(mfrow=c(1. 1))
png(filename = "plot3.png")
plot_sub_metering(get_energy_data(), TRUE)
dev.off()

