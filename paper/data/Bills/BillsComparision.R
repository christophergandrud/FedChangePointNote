# ---------------------------------------------------------------------------- #
# Creating Scrutiny Indicators
# Christopher Gandrud and Kevin Young
# 31 July 2014
# MIT License
# ---------------------------------------------------------------------------- #

# Number of bills addressing the powers of the Federal Reserve from:
# http://www.washingtonpost.com/blogs/monkey-cage/wp/2014/07/08/audit-the-fed-on-steroids/
# Figure scraped using: WebPlotDigitizer (http://dx.doi.org/10.5281/zenodo.10532)

# Set working directory. Change as needed.
setwd('/git_repositories/FedChangePointNote/paper/data/Bills/')

# Load packages
library(dplyr)
library(ggplot2)

# Load No. of Bills data
Bills <- read.csv('BillsData.csv')

# Clean
Bills$Bills <- round(Bills$Bills)
Bills <- arrange(Bills, year)
Bills <- subset(Bills, year > 1996)

# Plot
png(file = 'img/BillsVsHearings.png')
ggplot(Bills, aes(year, Bills)) +
    geom_line() +
    geom_vline(xintercept = 2007, linetype = 'dashed', colour = 'red') +
    xlab('') + ylab('No. of Bills\n') +
    theme_bw()
dev.off()
