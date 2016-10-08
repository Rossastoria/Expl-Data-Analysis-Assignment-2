## -- These commands create a plot of total emissions of PM2.5 from coal combustion in the United States.

    ## -- Use the SCC data to subset out the SCC codes associated with coal and combustion
> SCCcomb <- grepl(pattern = "comb", SCC$SCC.Level.One, ignore.case = TRUE)   ## scrap out combustion ids
> SCCcoal <- grepl(pattern = "coal", SCC$SCC.Level.Four, ignore.case = TRUE)  ## scrap out coal ids
> coalcomb <- (SCCcomb & SCCcoal)                                             ## intersect of combustion and coal ids
> SCCcoalcomb <- SCC[coalcomb, ]$SCC                                          ## subset SCC ids against "coal" and "comb"

    ## -- Create a subsetted data frame from NEI, then plot
> NEIcoalcomb <- NEI[NEI$SCC %in% SCCcoalcomb, ]                              ## subset coal combustion emissions data
> coalplot <- ggplot(aes(factor(year), Emissions), data = NEIcoalcomb)
> coalplot + geom_bar(stat = "identity", fill = "purple") 
  + labs(x = "Year", y = "Total PM2.5 Emission", title = "PM2.5 Emission from Combusting Coal, US")
> dev.copy(png, file = "Emissions_Plot4.png")
