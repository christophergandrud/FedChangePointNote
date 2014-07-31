##############
# Fed Change Data Creator: House
# Christopher Gandrud
# 10 June 2013, Updated 30 July 2014
##############

library(lubridate)
library(DataCombine)
library(plyr)

# Set working directory, change as needed
setwd('/git_repositories/FedChangePointNote/paper/data/')

MainData <- read.csv("builder/components/TestimonyRecords.csv",
                    stringsAsFactors = FALSE)

MainData$name[MainData$name == "man, Roger W. Ferguson Jr."] <- "Roger W. Ferguson Jr."

# Drop incomplete data
SubMain <- MainData[, c("Date", "NonFedFinanceCom", "CleanFullCommitteeName1",
                        "CleanFullCommitteeName2", "legislature", "laughter",
                        "attendance")]
SubMain$Date <- ymd(SubMain$Date)
SubMain <- SubMain[order(SubMain$Date),]

# Create Laughter variables for Full Finance and Fed Testimony
SubMain$MonthYear <- floor_date(SubMain$Date, "month")

SubMain <- DropNA(SubMain, "laughter")

# NAs for subcommittes that are missing
attach(SubMain)
  SubMain$CleanFullCommitteeName2[CleanFullCommitteeName2 == ""] <- NA
  SubMain$CleanFullCommitteeName2[CleanFullCommitteeName2 == "NA"] <- NA
detach(SubMain)

# Keep only full Senate Banking Committee
SubMain <- subset(SubMain,
                       CleanFullCommitteeName1 == "Committee on Banking, Housing, and Urban Affairs")

SubMain <- subset(SubMain, is.na(CleanFullCommitteeName2))

# Hearings count filler
SubMain$Any <- 1

# Sub Counts
MonthLaughter <- function(NewSumName, NewMeanName, Legislature = NULL){
  if (!is.null(Legislature)){
    SubTemp <- subset(SubMain, legislature == Legislature)
  }
  SubTemp <- ddply(SubTemp, .(MonthYear), transform, TempSum = sum(Any))
  SubTemp <- ddply(SubTemp, .(MonthYear), transform, TempMean = mean(laughter))
  SubTemp <- SubTemp[!duplicated(SubTemp[, "MonthYear"]), ]
  SubTemp <- SubTemp[, c("MonthYear", "TempSum", "TempMean")]
  names(SubTemp) <- c("MonthYear", NewSumName,  NewMeanName)
  SubTemp
}

## Fed
SubFedSenate <- MonthLaughter(NewSumName = "SumFedSenate",
                        NewMeanName = "FedLaughterSenate",
                        Legislature = "Senate")

#### ---- Merge in Econ Vars ---- ####
EconData <- read.csv("builder/components/FREDEconData.csv")

# Clean
EconData <- rename(EconData, c("DateField" = "MonthYear"))
EconData$MonthYear <- ymd(as.character(EconData$MonthYear))
EconData <- EconData[year(EconData$MonthYear) > 2000, ]

# Merge
Combined <- merge(SubFedSenate, EconData, by = "MonthYear", all = TRUE)

attach(Combined)
  Combined$FedLaughterSenate[is.na(FedLaughterSenate)] <- 0
  Combined$SumFedSenate[is.na(SumFedSenate)] <- 0
detach(Combined)

# Keep only month-years with full data
Combined <- subset(Combined, MonthYear < "2013-06-01")

# Save
write.csv(Combined, file = "SenateFullHearings.csv", row.names = FALSE)
