Creating Scrutiny Indicators
==================

Christopher Gandrud and Kevin Young

22 August 2014

> A paper describing multivariate change point analysis of Congressional scrutiny of
the United States Federal Reserve.

[<img src="https://zenodo.org/badge/5350/christophergandrud/FedChangePointNote.png" align="left"/>](http://dx.doi.org/10.5281/zenodo.11097)

<br>

## Description

We investigate trends in Congressional scrutiny of the US Federal Reserve from the late 1990s through 2012. Though independent, the Federal Reserve (the Fed) is accountable to legislative principals. Our aim is to develop indicators of latent scrutiny from congresspersons' behavior in committee hearings. These can be used to study the political stressors the Fed is under and how it responds. We use change point analysis to estimate periods of high and low legislative scrutiny from both the US House of Representatives and Senate. Surprisingly, though the Senate has the power to approve Fed appointments, their scrutiny of the Fed does not seem to noticeably change over our observation period. The House Committee on Financial Services did noticeably increase its scrutiny of the Fed during the recent financial crisis. The paper also introduces political scientists to new multivariate change point methods that can estimate latent legislative scrutiny states. These indicators could be used in future research to better understand legislative-bureaucratic relationships.

## Replication

The *[paper](paper/ChangePointCongFed.pdf)* and analyses can be completely reproduced using the files in this repository.

Use the *[paper/source/MainAnalysis_Figures.R](paper/source/MainAnalysis_Figures.R)* source file to reproduce all of the change point analyses and figures in the paper.  

All of the data used in the paper can be found in *[paper/data](paper/data)*. The most raw form of Congressional testimony data, including links to transcript PDFs and websites can be found in *[paper/data/builder/components/TestimonyRecords.csv](paper/data/builder/components/TestimonyRecords.csv)*.

A comparison of the Congressional hearing-based scrutiny indicators and previously used bill count measures can be found in *[paper/data/Bills/README.md](paper/data/Bills/README.md)*.

---

[<img src="http://media.tumblr.com/023c285c14ef01953d3b67ffe789004d/tumblr_inline_mor1uu2OOZ1qz4rgp.png" height = "100" align="left" />](http://nadrosia.tumblr.com/post/53520500877/made-in-berlin-badge-update)
