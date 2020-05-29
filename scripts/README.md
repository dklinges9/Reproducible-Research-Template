
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This
work is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative
Commons Attribution-ShareAlike 4.0 International License</a>.

**Attributions:**  
[Mindy Mallory Research Project Template](https://github.com/mindymallory/research-project-template)  
[Griffin Chure Reproducible Research](https://github.com/gchure/reproducible_research)  

Research Project Template
=========================

### Overview
This repository sets out the skeleton of an organizational structure used for scientific research. It loosely follows what I have used for several of my research projects and I hope it inspires you to conduct your research in an open, reproducible, and honest manner.

### How to Use
To use this template for your research, fork this repository, change the name
to something descriptive for your project, and adjust the licensing as you
see fit.


Getting Started
===============

First download the repository to your local machine. If you use Github,
then this will mean cloning the repository into a new R project. If you
are not a Github user, simply click 'Download Zip' and extract the file
to a convenient location.

Repository Contents
-------------------

The repository contains several folders and files. They are organized to
keep data preparation and cleaning in one file, `data-raw`, analysis in
another, `analysis`, and outputs from the analysis that will become
tables and figures, and numbers in the text of the manuscript,
`analysis-output`. The remaining files in the root directory are files
related to the manuscript itself. Next, we'll demonstrate how to link
the raw data to the analysis to the output to the manuscript so that all
the steps to generate the manuscript are automated and thus, not subject
to the inconsistencies that go along with piece-wise data preparation
and analysis.

Working with R and RStudio
-------------------------


Here are some tutorials and resources:  
- [Mindy Mallory]([Tutorial](http://mindymallory.github.io/research-project-template/intro-to-r/))  

Generate the Manuscript with One Click
======================================

Open the `manuscript-example.Rmd` and `tablesandfigures-examples.Rmd`
files in RStudio. Click the 'Knit PDF' button on the code editing pane.
Install the following packages, if they are not already installed:

    install.packages(xtable)
    install.packages(ggplot2)
    install.packages(ggfortify)
    install.packages(gridExtra)
    install.packages(Quandl)
    install.packages(RCurl)
    install.packages(xts)
    install.packages(urca)
    install.packages(vars)

Click the 'Knit PDF' button on the code editing pane, and voila! A PDF
of the manuscript should appear. In what follows we will walk through
what is happening step by step.

Putting it all Together
=======================

Now we see the contents of the data and analysis files and how they come
together.

The `data-raw` Folder
---------------------

The `data-raw` folder should either contain your raw data files (that
will **never** *ever* be modified), or a script that makes and api call,
or pulls the raw data in from a shared server, etc. In this example
file, there is a script called `fetch-raw-data.R`, and its contents are
shown below. This file fetches corn and soybean price data from
[quandl.com](quandl.com) and puts them in data objects called
`CZ2016 and SX2016`. Then it converts the data to `xts` objects, and
trims the dates to the study period of interest.

    # Filename: fetch-raw-data.R
    # This file fetches the raw data and performs pre-processing (cleaning) to get it ready for analyzs

    library(RCurl)
    library(xts)
    library(Quandl)
    Quandl.api_key("79SfoMaQc1npRAuq9ExZ")
    # Define Dates of Analysis
      start  <- '2015-01-01'
      today  <- format(Sys.time(),"%Y-%m-%d")

    # Fetch Corn and Soybean Prices
      CZ2016 <- Quandl("CME/CZ2016", type = "xts")
      SX2016 <- Quandl("CME/SX2016", type = "xts")

    # Trim the dates
      CZ2016 <- CZ2016[paste0(start,'/',today), 'Settle']
      SX2016 <- SX2016[paste0(start,'/',today), 'Settle']

Of course, every data cleaning and preparation activity will be
different, but in this file you should do all the preparation so that
the objects created by this script are ready to be accepted in the
`analysis.R` script.

The `analysis` Folder
---------------------

The contents of the `analysis` folder are below. The key is the line
that says, `source('data-raw/fetch-raw-data.R')`. This calls the
`fetch-raw-data.R` script so that when you run the code below, the raw
data are fetched and prepared (from scratch each time you run the
script). Then, the following contents of the `analysis.R` script test
the corn and soybean prices for the presence of unit roots via the ADF
test (Said and Dickey 1984).

    # Filename: analysis.R
    # This file performs statistical analysis. It could be just one file, so it doesn't neccessarly 
    #  need it's own folder, but sometimes your analysis may get complicated enough that you want 
    # to compartmentalize it. Separating different types of analyses into different scripts contained
    #  in the same folder can facilitate this

    library(urca)
    library(vars)
    # This line runs the source code that fetched your raw data and cleaned it. Now it is available 
    # for conducting analysis.
    source('data-raw/fetch-raw-data.R')

    # Store results of ADF tests for Corn and Soybeans in a list
    adf      <- list()
    adf[[1]] <- ur.df(CZ2016, type = 'drift', lags = 5)
    adf[[2]] <- ur.df(SX2016, type = 'drift', lags = 5) 


    # Store results of a Johansen cointegration test for Corn and Soybeans 
    jct      <- ca.jo(cbind(CZ2016, SX2016), type = 'eigen', K = 5)


    # Fit a VAR

    lag_selection <- VARselect(cbind(CZ2016, SX2016), lag.max = 8)

    var_model <- VAR(cbind(CZ2016, SX2016), p = 1, type = "const")

    # Save these results so that it can be pulled into the manuscript without re-running analysis.
    save(adf, jct, lag_selection, var_model, file = 'analysis-output/results.rda')

The `analysis-output` Folder
----------------------------

The last line of the code snippet above says,
`save(adf, jct, lag_selection, var_model, file = 'analysis-output/results.rda')`.
What this does is save the objects that contain the adf, Johansen
cointegration, and VAR regression results to an `.rda` file called
`results.rda` in the `analysis` folder. This 'R Data' file can be read
in by R and the variable names, `adf`, `jct`, `lag_selection`, and
`var_model` are preserved when loaded later. We will load the
`results.rda` file into the `tablesandfigures-example.Rmd` document to
make tables and figures in the manuscript.

The Manuscript
--------------

At the top of the file named `manuscript-example.Rmd` you see a YAML
(Yet Another Mark Up Language) header. This header tells knitr and
pandoc what exactly you want done with the document.

    ---
    title: "A Very Serious Analysis of the Stationarity of Corn and Soybean Prices"
    author: "Peter Economist, Paul Economist, Mary Economist"
    date: 'May 06, 2016'
    output: 
      pdf_document:
        template: simple.latex
        fig_caption: yes
    documentclass: ajae
    bibliography: bibliography.bib
    ---

`Title` and `author` are self explanatory.

`date`: field tells knitr to place the current date formatted in the
`%B %d, %Y` style.

`output`: After knitr evaluates code chunks contained in the body of the
file. The output feild tells pandoc what kind of file to create. Here we
have specified to produce PDF output. PDF output is produced by pandoc
creating a `.tex` file and if no further fields are specified there is a
latex template that pandoc uses to make the docuement (based on the
`article` class). Here we have specified to create the manuscript
according to the specifications of the American Journal of Agricultural
Economics (AJAE). Since they have their own latex class (`ajae`) that
comes in the standard latex distribution we can just specify
`documentclass: ajae` and the formatting is handled. We needed to also
specify `template: simple.latex` because something in the pandoc
template was clashing with the `ajae.csl` file. I removed the problem
lines and saved that as `simple.latex`, which you can see in the root
directory of this repository. We will cover how to specify different
output formats in a later section.

`bibliography`: The file `bibliography.bib` is located in the root
directory of this repository and it is a Bibtex database of all the
references needed for the manuscript. Open this file and note what the
reference entries look like. To build a database for your own paper,
Google Scholar has a 'cite' button below every search result it returns.
Click 'cite', then click 'Bibtex' and a plain text window will open with
the properly formatted Bibtex entry. Just copy and paste this into
`bibliography.bib`.

### Markdown Basics

Formatting a docuemnt with Markdown is very easy and there are many
resources to learn the basics. Start with
[<http://rmarkdown.rstudio.com/index.html>](http://rmarkdown.rstudio.com/index.html)
and explore.

Main points:

    # This is a Level 1 Header

This is a Level 1 Header
========================

    ## This is a Level 2 Header

This is a Level 2 Header
------------------------

    This is a citation of Akerlof's Lemons paper [@akerlof1970vthe].

This is a citation of Akerlof's Lemons paper (Akerlof 1970).

### Code Chunks

This is an example of a code chunk that is in the manuscript document.
The opening line tells `knitr` that what follows is code chunk to be
evaluated.

     ``{r, echo=FALSE, warning = FALSE, message = FALSE, results = "asis"}
     t = list()
     t[[1]] <- xtable(adf[[1]]@testreg, caption = "ADF Results for Corn")
     t[[2]] <- xtable(adf[[2]]@testreg, caption = "ADF Results for Soybeans")
     print.xtable(t[[1]], caption.placement = 'top', comment = FALSE)
     ``

In the opening code chunk, we specify that we want to load the results
from the `analysis-output` folder and we also want to fetch the raw
data, which we will plot in a later code chunk. Also, we load all the
libraries that will be used by later code chunks.

    ``{r, warning = FALSE, message = FALSE, echo=FALSE}
    library(xtable)
    library(ggplot2)
    library(ggfortify)
    library(gridExtra)
    source('data-raw/fetch-raw-data.R')
    load('analysis-output/results.Rda')
    ```

A Note About Latex Styles and the YAML Header
=============================================

Getting the pandoc default latex and the latex style you prefer to work
can be a little tricky. In the root directory of this repository there
is a file called `style-headers.md` This contains a few complete YAML
headers that should work if you copy and paste them to replace the
current manuscript's YAML header.

Collaborating with Microsoft Word Users
=======================================

Many of us have colleagues who expect to recieve and be welcomed to edit
Microsoft Word documents. Fortunately, reproducability can be
maintained. With the `manuscript-example.Rmd` file open, notice that the
`knit PDF` button is actually a drop down menu and `knit Word` is an
option. If you click it, it will return to you a Microsoft Word document
that you can deliver to your colleague or professor.

They can be formatted with a .docx template. See the 'Style Reference\`
description on
[this](http://rmarkdown.rstudio.com/word_document_format.html) page.
Using the template will keep you having to format the whole thing every
time you update your colleagues and professors.

You might have noticed that there is also a `tablesandfigures.Rmd` file
in the root directory. This is for users who will need to produce Word
documents. I have found no clean way to produce decently formatted
tables and figures in Word using this method. I recommend keeping tables
and figures in a separate docuemnt that you always render as a PDF, and
a separate file for the manuscript text.

Equations are still a problem. Pandoc can interpret math symbols
surrounded by `$`, as `$\exp^{i \pi} = -1$` will be rendered as
exp<sup>*i**π*</sup> =  − 1. However, these equations are not
automatically numbered. To get automatically numbered equations that can
be cross-referenced, they must be produced with pure Latex code. As in,

`\begin{equation} \Delta y_t = \alpha + \gamma y_{t-1} + \delta_1 \Delta y_{t-1} + \dots + \delta_{p-1} \Delta y_{t-p-1} + \epsilon_t \end{equation}`

being rendered as,

Δ*y*<sub>*t*</sub> = *α* + *γ**y*<sub>*t* − 1</sub> + *δ*<sub>1</sub>Δ*y*<sub>*t* − 1</sub> + … + *δ*<sub>*p* − 1</sub>Δ*y*<sub>*t* − *p* − 1</sub> + *ϵ*<sub>*t*</sub>

The trouble is that Latex is ignored by pandoc when producing Word
documents so when you knit the Word document after writing your
equations in pure Latex, they will be missing from the Word docuemnt.
This means you will have to replace them in the Word document one way or
another. There is a reasonable workaround. [Iguana
Tex](http://www.jonathanleroux.org/software/iguanatex/) is a Microsoft
Powerpoint add-in that takes latex equations and returns
copy-and-pasteable figures of typeset equations. I recommend creating
one new slide for each equation in your document, then use Iguana Tex to
obtain figures of your equations that can be pasted into the Word
document.

Starting Your Own Reproducable Project
======================================

Once you understand how all the peices fit together you can modify these
files to conduct your own reproducable project. Just make sure your
`data-raw` is accessed by your analysis scripts and that your results
are stored in the `anlaysis-output` folder. Then make sure your
manuscript pulls the data and analysis results automatically.

References
==========

Akerlof, George. 1970. “The Market for Lemons: Qualitative Uncertainty
and the Market MechanismV.” *Quarterly Journal of Economics* 84.

Gandrud, Christopher. 2013. *Reproducible Research with R and R Studio*.
CRC Press.

Said, Said E, and David A Dickey. 1984. “Testing for Unit Roots in
Autoregressive-Moving Average Models of Unknown Order.” *Biometrika* 71
(3). Biometrika Trust: 599–607.
