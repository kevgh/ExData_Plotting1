## simple script to create plot1 and a corresponding png file

source("read_data.R")

# plot histogram of active power per example
plot_active_power <- function(energy_data)
{
  hist(as.numeric(energy_data[, "Global_active_power"]), col="red",
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
}

par(mfrow=c(1, 1))
#png(filename = "plot1.png")
plot_active_power(get_energy_data())
#dev.off()
