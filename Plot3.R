## -- These commands use ggplots to produce a barplot segmented by source type from the NEI data.

> p <- ggplot(aes(x = year, y = Emissions, fill = type), data = NEIBalt)
> p + geom_bar(stat = "identity") + facet_grid(.~type) + labs(x = "year", y = "PM2.5 Emissions", title = "PM2.5 Emissions, Baltimore, by Source")
> dev.copy(png, title = "Emissions_Plot3.png")
