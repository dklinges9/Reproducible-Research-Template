-   Research Project Template
-   Getting Started
    -   Repository Contents
-   The `data-raw` Folder

Research Project Template
=========================

This repository contains a template for a reproducable research project.
The fundamental idea of reproducable research is that the steps that
take your research from raw data to manuscript, thesis, or report should
be fully automated. This way, your work can be checked by your advisor,
mentors, collaborators, others working in your area, journal reviewers,
and your future self.

I became interested in reproducable research because I was tired of
being terrified of my own analysis. I was constantly petrified someone
would question my work and ask me to open the black box and verify what
I did was correct; in some cases even being asked reproduce a result was
terrifiying because I knew the convoluted path of data prep and cleaning
that I took in arriving at my result.

I read the book [Reproducable Research with R and
RStudio](http://www.amazon.com/Reproducible-Research-Studio-Chapman-Hall/dp/1466572841)
by Christopher Gandrud (2013), and I read a lot of blog posts and
tutorials by [Karl Broman](http://kbroman.org/pages/software.html) and
[Carl
Boettiger](http://www.carlboettiger.info/2012/05/06/research-workflow.html)
and I struck out on my own path to execute a reproducable research
project from start to finish. The repository for that project is
[here](https://github.com/mindymallory/BBOBAS), while I was successful
in learning the basics of how r, rmarkdown, knitr, and pandoc combine to
make reproducable research possible, you can tell just by looking at the
project's Github repository that I failed miserably at making the
project reproducable. This is because the repository is totally
unorganized, and I am pretty sure I am the only one who could reproduce
the results from this project.

But in that failure, I learned a lot about how a reproducable research
project should be organized. I built this template for my future
students and for my future self.

Getting Started
===============

First download the repository to your local machine. If you use Github,
then this will mean cloning the repository into a new R project. If you
are not a Github user, simply click 'Download Zip' and extract the file
to a convenient location.

Repository Contents
-------------------

The repository contains several folders and files. They are organized to
keep data preperation and cleaning in one file, `data-raw`, analysis in
another, `analysis`, and outputs from the analysis that will become
tables and figures, and numbers in the text of the manuscript,
`analysis-output`. The remaining files in the root directory are files
related to the manuscript itself. Next, we'll demonstrate how to link
the raw data to the analysis to the output to the manuscript so that all
the steps to generate the manuscript are automated and thus, not subject
to the inconsistencies that go along with peice-wise data preparation
and analysis.

The `data-raw` Folder
=====================

The `data-raw` folder should either contain your raw data files (that
will **never** *ever* be modified), or a script that makes and api call,
or pulls the raw data in from a shared server, etc. In this example
file, there is a script called `fetch-raw-data.R`, and its contents are
shown below

    # Filename: fetch-raw-data.R
    # This file fetches the raw data and performs pre-processing (cleaning) to get it ready for analyzs

    library(RCurl)

    ## Loading required package: bitops

    library(xts)

    ## Loading required package: zoo
    ## 
    ## Attaching package: 'zoo'
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     as.Date, as.Date.numeric

    # Define Dates of Analysis
      start  <- '2015-01-01'
      today  <- format(Sys.time(),"%Y-%m-%d")

    # Fetch Corn and Soybean Prices
      CZ2016 <- getURL("https://www.quandl.com/api/v1/datasets/CME/CZ2016.csv")
      SX2016 <- getURL("https://www.quandl.com/api/v1/datasets/CME/SX2016.csv")

      CZ2016 <- read.csv(text = CZ2016)
      SX2016 <- read.csv(text = SX2016)

    # Define first column to be a date.
      CZ2016[,1] <- as.Date(CZ2016[,1])
      SX2016[,1] <- as.Date(SX2016[,1])

    # Define the data objects to be xts objects, and keep only settlement prices
      CZ2016 <- xts(CZ2016[,'Settle'], order.by=CZ2016[,1])
      SX2016 <- xts(SX2016[,'Settle'], order.by=SX2016[,1])

    # Trim the dates
      CZ2016 <- CZ2016[paste0(start,'/',today)]
      SX2016 <- SX2016[paste0(start,'/',today)]

References
==========

Gandrud, Christopher. 2013. *Reproducible Research with R and R Studio*.
CRC Press.
