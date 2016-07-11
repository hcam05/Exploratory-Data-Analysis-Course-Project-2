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
Baltimore_Vehicle <- NEI %>%
    filter(fips == "24510") %>%
    filter(type == "ON-ROAD") %>%
    group_by(year) %>%
    summarise(EMYear = sum(Emissions))
LACounty_Vehicle <- NEI %>%
    filter(fips == "06037") %>%
    filter(type == "ON-ROAD") %>%
    group_by(year) %>%
    summarise(EMYear = sum(Emissions))
#plotting data
png("plot6.png")
ggplot(data=Baltimore_Vehicle, aes(year, EMYear))+
    geom_line(aes(color="Baltimore"))+
    geom_line(data=LACounty_Vehicle, aes(color="Los Angeles"))+
    ggtitle("Motor Vehicle Emissions Los Angeles vs Baltimore County") +
    labs(color = "City") +
    xlab("Year") +
    ylab("PM25 Emissions")
dev.off()