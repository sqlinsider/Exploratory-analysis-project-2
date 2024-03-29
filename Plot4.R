# merge the two data sets.. assumed that the variables are already existing. Else run the plot1 to import those  
 if(!exists("NEISCC")){ 
   NEISCC <- merge(NEI, SCC, by="SCC") 
 } 
 

 library(ggplot2) 
 

 # Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008? 
 

 # fetch all NEIxSCC records with Short.Name (SCC) Coal 
 coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE) 
 subsetNEISCC <- NEISCC[coalMatches, ] 
 
 aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum) 
 
 png("plot4.png", width=640, height=480) 
 g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions)) 
 g <- g + geom_bar(stat="identity") + 
   xlab("year") + 
   ylab(expression('Total PM'[2.5]*" Emissions")) + 
   ggtitle('Total Emissions from coal from 1999 to 2008') 
 print(g) 
 dev.off() 
