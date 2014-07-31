# Comparing Scrutiny Indicators: Bills vs. Hearings

In ''[Creating Scrutiny States](FedChangePointNote/README.md)'' we develop indicators of Congressional scrutiny of the US Federal Reserve. The indicators are created using a change point analysis of congresspersons' behavior in relevant committee hearings.

Previous research on Congressional-Federal Reserve relations has tended to focus not on congressper- sons’ behavior in hearings, but instead on counts of proposed legislation that pertains to the Fed (e.g. Kettl, 1988), many of which do not become law (Binder, 2014). Both hearings and bills indicate Congres- sional scrutiny. Nonetheless, data from hearings is a more direct and relevant window onto day-to-day scrutiny as committees and their hearings are Congress’ primary oversight tool (Oleszek, 2013, 382) and proposed bills need to pass through these committees to become law. Bill counts also do not capture situations where Congress increases its scrutiny followed by the Fed successfully responding to head off legislative action

The following figure compares perhaps the most recent data on yearly counts of proposed bills that pertain to the powers of the Federal Reserve gathered from Binder (2014) (see below for details) with the change points we estimate using data from hearings of the House Committee on Financial Services (HCFS). Dashed red lines indicate years with a change point in HCFS hearing scrutiny. The change point in the hearings data is April 2007. Before May 2007 was a low scrutiny state. After April 2007 was a high scrutiny state.

### Number of Bills Pertaining to the Fed's Powers Compared to HCFS Hearing Scrutiny States (1997-2012)

[<img src="img/BillsVsHearings.png" align="middle"/>]()

There is certainly overlap between the two scrutiny indicators. The high scrutiny state contains 2009, which had by far the most proposed legislation pertaining to the Fed's power (62 bills). It is important to note that bill counts appear to provide a lagging indicator of scrutiny. The year with the highest bill counts was a year and a half after congressperson's behavior changed in committee hearings.

## Gathering Data on Bills

Binder's (2014) data was made available in a plot. To gather this data we used the plot scrapper [WebPlotDigitizer ](http://dx.doi.org/10.5281/zenodo.10532). This method may introduce small rounding errors into the data. However, the overall trends in the data are accurately captured by the figure above.

## References

Binder, Sarah. 2014. ''Audit the Fed . . . On Steroids.'' *The Washington Post: Monkey Cage Blog*. <http://www.washingtonpost.com/blogs/monkey-cage/wp/2014/07/08/audit-the-fed-on-steroids/>. Accessed July 2014.

Kettl, Donald. 1988. *Leadership at the Fed*. New Haven: Yale University Press.

Oleszek, Walter J. 2013. *Congressional procedures and the policy process*. London: Sage.
