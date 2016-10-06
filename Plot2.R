## -- The commands produce a plot of PM2.5 in Baltimore sufficient to show that from 1999 to 2008
## -- total emissions declined, with an uptick in 2005.

> NEIBalt <- subset(NEI, fips == "24510") ## subset to relevant fips
> BaltTotal <- aggregate(Emissions ~ year, NEIBalt, sum) ## sum up emissions by year
> plot(BaltTotal, type = "l", ylab = "Total PM2.5 Emissions, Baltimore") ## simple plot of total emissions by year
> dev.copy(png, file = "Emissions_Plot2.png")
