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

#data analysis using dplyr
data <- NEI %>% 
    group_by(year) %>%
    summarise(EMYear = sum(Emissions))
#plotting data
png("plot1.png")
plot(data, type = "o", col = "green", main = "Total Emissions In US By Year", xlab = "Year", ylab = "PM25 Emissions")
dev.off()
