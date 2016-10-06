## The following commands produce a plot of total emissions against year sufficient to determine that
## total emissions of PM 2.5 have decreased from 1999 to 2008

## -- read in data per website instructions -- ##
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

## -- create a new data frame
> total <- aggregate(Emissions ~ year, NEI, sum)
> total$year <- as.numeric(total$year)

## --- create plot and copy device to a png
> plot(total, type = "l", ylab = "Total Emissions of PM2.5")
> dev.copy(png, file = "Emissions_Plot1.png")
> dev.off()
