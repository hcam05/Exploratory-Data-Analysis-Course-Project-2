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
Baltimore <- NEI %>%
    filter(fips == "24510") %>%
    group_by(year) %>%
    summarise(EMYear = sum(Emissions))
#plotting data
png("plot2.png")
plot(Baltimore, type = "o", col = "purple", 
     main = "Total Emissions in Baltimore, MD", xlab = "Year", ylab = "PM25 Emissions")
dev.off()