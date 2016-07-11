#packages needed to conduct analysis and construct plots
library(downloader)
library(ggplot2)
library(dplyr)
#downloading files
setwd("/Users/hcam/Desktop/Coursera/Exploratory Data Analysis/Final/")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(url, dest="dataset.zip", mode ="wb")
unzip ("dataset.zip", exdir = "./")
#reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#filtering data with dplyr
CoalSCC <- SCC %>%
    filter(grepl("Coal", EI.Sector))

coal<-subset(NEI, SCC %in% data1$SCC)   

CoalNEI <- NEI %>%
    filter(SCC %in% CoalSCC$SCC)
#plotting data
png("plot4.png")
ggplot(data=CoalNEI, aes(x=year, y=Emissions, fill = type)) + 
    geom_bar(stat="identity", position=position_dodge()) + 
    ggtitle("US Coal Combustion Emissions") +
    xlab("Year") +
    ylab("PM25 Emissions")
dev.off()