# Creating Federal Testimony Indicators

31 July 2014

This directory includes the data and source code files needed to create the raw Congressional Testimony and Macroeconomic data indicators used in the the change point analyses.

There are three source code files used to create the data used in the change point analysis:

- *[ChangePoint_HouseFull.R](ChangePoint_HouseFull.R)*: Creates the monthly frequency, attendance, formal letter requests, and laughter data for testimony to the House and combines this with the economic data.

- *[ChangePoint_SenateFull.R](ChangePoint_SenateFull.R)*: Creates the monthly frequency and laughter data for testimony to the Senate and combines this with the economic data.

- *[EconData.R](EconData.R)*: gathers macroeconomic data from [FRED](http://research.stlouisfed.org/fred2/).

There are two main data files in the *[components](components/)* subdirectory:

- *[TestimonyRecords.csv](components/TestimonyRecords.csv)*: Includes counts of attendance, formal letter requests, and laughter in Congressional hearings as well as links to the PDFs of transcripts from these hearings and Federal Reserve testimony. Attendance, letter requests, and laughter was largely hand counted by research assistants from the PDF transcripts.

- *[EconData.csv](components/EconData.csv)*: Economic data gathered from FRED using the source file *[EconData.R](EconData.R)*. For variable descriptions see *[EconDataDescription.md](components/EconDataDescription.md)*.
