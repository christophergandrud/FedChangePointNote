################
# Testimony Sum by Month
# This creates a simple count of times the Fed gave testimony before Congress
# The data was gathered from the Federal Reserve's website:
# http://www.federalreserve.gov/newsevents/default.htm
# Christopher Gandrud
# 31 May 2013, updated 31 July 2014
# MIT License
################

# Load libraries
library(lubridate)
library(plyr)
library(DataCombine)

# Set working directory, change as needed
setwd('/git_repositories/FedChangePointNote/paper/data/raw_builder/')

#### ---------------Testimony------------------ #######
# Import testimony data
TestimonyData <- read.csv("components/TestimonyRaw.csv")
TestimonyData$full_date <- as.character(TestimonyData$full_date)

# Declare full_data varaiable to be a dat variable
TestimonyData$Date <- dmy(TestimonyData$full_date)

TestimonyData <- TestimonyData[order(TestimonyData$Date), ]

#### Month-Year (rounded to closest month) Variable
TestimonyMonth <- TestimonyData
TestimonyMonth$MonthYear <- floor_date(TestimonyMonth$Date, "month")
TestimonyMonth <- MoveFront(TestimonyMonth, "MonthYear")

#### Make testimony per month Data ####
# Create month sums
TestimonyMonth$Any <- 1
TestimonyMonth <- ddply(TestimonyMonth, .(MonthYear), 
                        transform, MonthTestTotal = sum(Any)) 
TestUnique <- TestimonyMonth[!duplicated(TestimonyMonth[, 1]), ]

# Keep MonthYear & MonthTotal
TestimonyMonthTotals <- TestUnique[, c("MonthYear", "MonthTestTotal")]

# Save
write.csv(TestimonyMonthTotals, file = "components/TestimonyPerMonth.csv")
