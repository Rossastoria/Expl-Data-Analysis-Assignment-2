## -- These commands create a plot of total PM2.5 emissions from vehicles in Baltimore

  ## -- Create subseted data frame of the values (i.e., vehicles)
> vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)      ## id vehicle emissions from SCC 
> SCCVehicle <- SCC[vehicle,]$SCC                                         ## subset out id numbers from SCC
> NEIVehicle <- NEI[NEI$SCC %in% SCCVehicle,]                             ## subset vehicles from NEI data

  ## -- Subset out emissions from LA County and Baltimore
> NEIVehBalt <- subset(NEIVehicle, fips == "24510")
