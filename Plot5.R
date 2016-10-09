## -- These commands create a plot of total PM2.5 emissions from vehicles in Baltimore

  ## -- Create subseted data frame of the values (i.e., vehicles)
> vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)      ## find vehicle emissions in the SCC 
> SCCVehicle <- SCC[vehicle,]$SCC                                         ## subset out id numbers from SCC
> NEIVehicle <- NEI[NEI$SCC %in% SCCVehicle,]                             ## subset vehicles from NEI data

  ## -- Subset out emissions from Baltimore and sum to find total emissions
> NEIVehBalt <- subset(NEIVehicle, fips == "24510")
> totalBaltVeh <- aggregate(Emissions ~ year, NEIVehBalt, sum)

  ## -- Create a plot
> plot(totalBaltVeh, type = "l", ylab = "Total PM2.5 Vehicle Pollution", main = "Baltimore PM2.5 Vehicle Pollution")
> dev.copy(png, file = "Emissions_Plot5.png")
> dev.off()
