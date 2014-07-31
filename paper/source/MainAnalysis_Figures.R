# ---------------------------------------------------------------------------- #
# R source code for all analysis/figures in Creating Scrutiny Indicators:
# A Change Point Exploration of Congressional Scrutiny of the US Federal Reserve
# Christopher Gandrud and Kevin Young
# 31 July 2014
# Using R v 3.1.1
# MIT License
# ---------------------------------------------------------------------------- #

# --------------------------------- Set Up ----------------------------------- #
# Set working directory. Change as needed
setwd('/git_repositories/FedChangePointNote/paper/')

# Load packages
Pkgs <- c("repmis", "ecp", "gridExtra", "ggplot2", "reshape2", "dplyr")
repmis::LoadandCite(Pkgs)

# Load e.divGG function
source('source/e.divGG.R')

# Load data
HouseMonth <- read.csv("data/HouseFullHearings.csv", stringsAsFactors = FALSE)
SenateMonth <- read.csv("data/SenateFullHearings.csv", stringsAsFactors = FALSE)

# -------------------------- Change Point Analysis --------------------------- #
#### House Scrutiny change point ####
ScrutVarsHouse <- c("SumFedHouse", "FedAttend", "FedLetter", "FedLaughterHouse")
FedTitles <- c("Hearing Frequency", "Attendance",
               "Letter Corrrespondence", "Laughter")
e.divGG(data = HouseMonth, Vars = ScrutVarsHouse, TimeVar = "MonthYear",
        sig.lvl = 0.05, R = 999, min.size = 4, Titles = FedTitles)

#### Scrutiny Non-Fed Hearings change point ####
NonFedVars <- c("SumNonFed", "NonFedAttend", "NonFedLaughter")
NonFedTitles <- c("Hearing Frequency", "Attendance", "Laughter")
e.divGG(data = HouseMonth, Vars = NonFedVars, TimeVar = "MonthYear", 
        Titles = NonFedTitles,sig.lvl = 0.05, R = 999, min.size = 4)

#### Senate Scrutiny change point ####
# Note: No significant at 0.05 level
ScrutVarsSenate <-c('SumFedSenate', 'FedLaughterSenate')
SenateTitles <- c("Hearing Frequency", "Laughter")
e.divGG(data = SenateMonth, Vars = ScrutVarsSenate, TimeVar = "MonthYear",
        sig.lvl = 0.05, R = 999, min.size = 4, Titles = SenateTitles)

#### Create line graph of counts and means ####
SenateTitles <- c("Hearing Frequency", "Laughter")
SubMonth <- SenateMonth[, c("MonthYear", "SumFedSenate", "FedLaughterSenate")]
SubMolten <- melt(data = SubMonth, id.vars = "MonthYear",
                  meansure.vars = c("SumFedSenate", "FedLaughterSenate"))
SubMolten$MonthYear <- as.POSIXct(SubMolten$MonthYear)
eachVar <- unique(SubMolten$variable)
VarLabels <- data.frame(eachVar, SenateTitles, stringsAsFactors = FALSE)
Rows <- 1:nrow(VarLabels)
p <- list()
for (i in Rows){
    SubData <- subset(SubMolten, variable == VarLabels[i, 1])
    Title_i <- VarLabels[i, 2]
    p[[i]] <-   ggplot(data = SubData,
                       aes(x = MonthYear, y = value)) +
        geom_line() +
        xlab("") + ylab("") + ggtitle(paste(Title_i, "\n")) +
        theme_bw()
}
suppressWarnings(do.call(grid.arrange, p))

#### Economic variables change point ####
EconVars <- c("PCEPIPercent", "U6RATE", "GDPC96Percent", "CaseShillerChange")
EconTitles <- c("Inflation", "Unemployment", "Growth", "Case-Shiller Change")
e.divGG(data = HouseMonth, Vars = EconVars, TimeVar = "MonthYear",
        Titles = EconTitles, sig.lvl = 0.05, R = 999, min.size = 24)

# ----------------------- Comparison to Bills -------------------------------- #
# Load No. of Bills data
Bills <- read.csv('data/Bills/BillsData.csv')

# Clean
Bills$Bills <- round(Bills$Bills)
Bills <- arrange(Bills, year)
Bills <- subset(Bills, year > 1996)

# Convert date to POSIX amenable format
Bills$year <- paste0(Bills$year, "-01-01")

e.divGG(data = Bills, Vars = "Bills", TimeVar = "year", R = 999, min.size = 4)
