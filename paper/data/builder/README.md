# Creating Federal Testimony Indicators

1 August 2014

This directory includes the data and source code files needed to create the versions of the Congressional testimony and macroeconomic data indicators used in the the change point analyses.

There are three source code files used to create the data used in the change point analysis:

- *[ChangePoint_SenateFull.R](ChangePoint_SenateFull.R)*: Processes *[TestimonyRecords.csv](components/TestimonyRecords.csv)* for the analysis for the US Senate. This includes creating monthly counts of hearings where the Fed testified and means of laughter.

- *[ChangePoint_HouseFull.R](ChangePoint_HouseFull.R)*: Processes *[TestimonyRecords.csv](components/TestimonyRecords.csv)* for the analysis for the US House of Representatives. This includes creating monthly counts of hearings where the Fed testified and means of laughter and formal letter correspondence.

- *[EconData.R](EconData.R)*: gathers macroeconomic data from [FRED](http://research.stlouisfed.org/fred2/).

There are two data files in the *[components](components/)* subdirectory:

- *[TestimonyRecords.csv](components/TestimonyRecords.csv)*: includes details on each of the Congressional hearings transcripts (including links to PDFs) as well as basic data gleamed from these transcripts including laughter counts and formal letter correspondence. These were largely coded by research assistants.

- *[FREDEconData.csv](components/FREDEconData.csv)*: Economic data gathered from [FRED](http://research.stlouisfed.org/fred2/) using the source file *[EconData.R](EconData.R)*. For variable descriptions see *[EconDataDescription.md](components/EconDataDescription.md)*.
