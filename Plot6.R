## -- These commands produce plots of PM2.5 Emissions from vehicles in LA County and Baltimore.

  ## -- Create subseted data frame of the values (i.e., vehicles)
> vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)      ## id vehicle emissions from SCC 
> SCCVehicle <- SCC[vehicle,]$SCC                                         ## subset out id numbers from SCC
> NEIVehicle <- NEI[NEI$SCC %in% SCCVehicle,]                             ## subset vehicles from NEI data

  ## -- Subset out emissions from LA County and Baltimore
> NEIVehBaltLA <- subset(NEIVehicle, fips == "24510" | fips == "06037")

  ## -- Create Plot
> vehicleplot <- ggplot(aes(x = year, y = Emissions), data = NEIVehBaltLA)
> vehicleplot + geom_bar(stat = "identity", fill = "purple") + facet_grid(.~fips) 
    + labs(x = "Year", y = "TotalPM2.5 Emission per year", title = "PM2.5 Emissions, LA county and Baltimore")
> dev.copy(png, file = "Emissions_Plot6.png")
