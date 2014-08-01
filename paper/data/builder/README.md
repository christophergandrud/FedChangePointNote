# Creating Federal Testimony Indicators

1 August 2014

This directory includes the data and source code files needed to create the raw Congressional Testimony and Macroeconomic data indicators used in the the change point analyses.

There are three source code files used to create the data used in the change point analysis:

- *[FedLaughterMembers.R](FedLaughterMembers.R)*: Creates monthly means of laughter and attendance in Congressional hearings. Merges this with the Fed hearing counts and economic data.

- *[TestMonthCount.R](TestMonthCount.R)*: counts the number of testimonies per month that the Fed is asked to give to Congress. Creates the file *[components/TestimonyPerMonth.csv](components/TestimonyPerMonth.csv)*.

- *[EconData.R](EconData.R)*: gathers macroeconomic data from [FRED](http://research.stlouisfed.org/fred2/).

There are three main data files in the *[components](components/)* subdirectory:

- *[MonetaryPolicyChron.csv](components/MonetaryPolicyChron.csv)*: Includes counts of attendance and laughter in Congressional hearings as well as links to the PDFs of transcripts from these hearings. Attendance and laughter was largely hand counted by research assistants from the PDF transcripts.

- *[TestimonyRaw.csv](components/TestimonyRaw.csv)*: descriptions of instances where the Federal Reserve gave testimony to Congress. Includes links to the Fed's prepared remarks. Data gathered from the [Federal Reserve's website](http://www.federalreserve.gov/newsevents/default.htm).

- *[EconData.csv](components/EconData.csv)*: Economic data gathered from FRED using the source file *[EconData.R](EconData.R)*. For variable descriptions see *[EconDataDescription.md](components/EconDataDescription.md)*.
