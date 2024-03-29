#Assumed that the variables are already existing. Else run the plot1 to import those  
 
library(ggplot2) 

 # How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
 

 # 24510 is Baltimore, see plot2.R 
 # Searching for ON-ROAD type in NEI 
 subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ] 
 

 aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum) 
 


 png("plot5.png", width=840, height=480) 
 g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions)) 
 g <- g + geom_bar(stat="identity") + 
   xlab("year") + 
   ylab(expression('Total PM'[2.5]*" Emissions")) + 
   ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore, Maryland (fips = "24510") from 1999 to 2008') 
 print(g) 
 dev.off() 
