

Introduction to Git and GitHub
------------------------------  

_Version control and file management without pulling your hair out_

The goals of this tutorial are to demonstrate the potential of using Git and GitHub for reproducible research. This does not entail reviewing the nitty-gritty of Git version control– there's many accessible resources for that– but provides the basic tools and language to effectively collaborate on other's projects, and get started with your own.  

Hopefully everyone comes away with either some new knowledge/skills, or additional inspiration for how to teach your colleagues about the practices you've been implementing.  

- how to structure a repository in an intuitive fashion that makes access easy for others (e.g. how many/what subdirectories to have, what their contents will be, directory naming conventions, etc.
- some suggestions on using READMEs to document directories and files (a little bit of overview on Markdown)
- some helpful tips when writing R code that will be part of a dynamic repository (mostly related to relative filepaths: why I discourage using setwd(), how to make file paths relative and include wildcard characters, etc.)
  

&nbsp;
&nbsp;

## Agenda
- Intros, housekeeping, troubleshooting, etc. (10 mins)  
- Why GitHub and reproducible workflows (10 mins)  
- GH repository structure (15 mins)  
	- Template structures  
	- 
- Git basics: Git workflow (5 mins)  
- Git basics: fork and clone (5 mins)  
- documentation using markdown (15 mins)  
	- quick basics to Markdown  
	- what to put in a root README   
	- what to put in subdirectory READMEs 
- Git basics: commit (10 mins)    
- BREAK (15 mins)  
- coding for reproducibility (15 mins)  
	- R projects
	- .gitignore
	- Script architecture  
- working with large files: Git LFS (15 mins)  
	- setting up Git LFS  
	- tracking files  
	- storing files locally  
- Git basics: push (10 mins)   
- helping with SoilTemp (15 mins)   
- GH perks: academic discounts, etc. (10 mins)  


#### Notes to learners
- Ask questions!  
- I've given a version of this tutorial before but lots of mods, please feedback!  



## Git and Reproducible Workflows: Intro
_why use version control? Developing software and managing data so that others can access your work easily and you'll remember what you've done_  

- setting up a GitHub repository in an effective manner
- how to make code portable for collaborators
- using Markdown to document code and files: the value of READMEs
- working with large files


## Why GitHub?

- the benefit of Dropbox and GitHub over external drive is that files can be shared over Dropbox and GitHub but I can't send files directly from an external drive. So external drive good for processing data on my own, but not for collaboration  

- the benefit of GitHub over Dropbox is:  
1) that you can keep a history of your changes to the files (that's what version control is). Think of Microsoft Word's track changes, but for data and code. This is helpful for documenting progress, and if something is screwed up you can revert to a previous version of data/code without the need to remember what exact changes you made  
&nbsp;
2) with GitHub, files talk to each other better than on Dropbox. On Dropbox you need to either manually drag 'n drop each file into your online Dropbox, which can take a lot of time, or have everything stored in a folder that is on Dropbox– RStudio doesn't like this latter option because Dropbox constantly tries to refresh the folder by grabbing files and looking at them, and RStudio gets angry because it wants to be using the files at the same time  
&nbsp;
3) GitHub is much better for display online than dropbox. Baecher and I both like using Markdown to generate reports with figures and code....GitHub is set up so that Markdown files are displayed automatically. See Rebecca Senior's ThermStats and the Coastal Carbon database that I managed for the Smithsonian– the text and figures displayed when you scroll down on either of them are put together on a Markdown. I like this because one of my collaborators can access the GitHub webpage, get an immediate refresher of what this project is, and jump right into contributing. You can't display like this on Dropbox.  
&nbsp;
4) You'll be more prepared for navigating (and deploying) software packages.  Many R and Python packages have developer versions hosted on GH 


## Starting with Git and GitHub  
_a brief overview of how Git works_   

- **Assuming at this point that everyone is logged into their account** 

&nbsp;
&nbsp;

#### Navigating GitHub Repository Website

[Reproducible Research Template](INSERT LINK)  


**Databases**:  
[Coastal Carbon Network Data Library](https://github.com/Smithsonian/CCRCN-Data-Library) (also see [RShiny app](https://ccrcn.shinyapps.io/CoastalCarbonAtlas/)  

[ForestGEO ForC](https://github.com/forc-db/ForC) (also see [website](https://forc-db.github.io/) and [RShiny app](https://forc.shinyapps.io/global_data_visualization/)    

&nbsp;

**Projects**:  
[PortalData](https://github.com/weecology/PortalData)  
[Animal Social Networks](https://github.com/bansallab/asnr/) (also see [website](https://bansallab.github.io/asnr/data.html)   
[Hanson et al 2020 Global Priority Areas](https://github.com/jeffreyhanson/global-protected-areas)  

&nbsp;

**R Packages**:  
[RGedi](https://github.com/carlos-alberto-silva/rGEDI)  
[Mike Kearney's NicheMapR](https://github.com/mrke/NicheMapR) (also see [website](https://mrke.github.io/)  
[prioritizr: conservation prioritization](https://github.com/prioritizr/prioritizr)   
[ThermStats](https://github.com/rasenior/ThermStats)  

&nbsp;

_a number of languages (unfortunately not R) are supported for code view on GH. [See here for more](https://help.github.com/en/github/managing-files-in-a-repository/navigating-code-on-github)._  




#### 5 Commands to Remember:

- git pull 
- git status   
- git add  
- git commit
- git push  

Everything else: [cheatsheets](https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf) and [StackOverflow](https://stackoverflow.com/questions/315911/git-for-beginners-the-definitive-practical-guide)   

&nbsp;


### Getting Started
&nbsp;

#### Fork a Repository
Fork: create a copy of a remote repository that is stored on the remote server


- Top right of webpage: "Fork". This will take a few seconds...  


#### Clone the Repository
- Click "Clone or Download" and the Clipboard icon  
- Go to GitHub Desktop app, File>Clone Repository  
- Paste url and designate local location  
- It may ask you to initialize Git LFS. If you click yes it will prompt you to download  



#### How Many Repositories?
- 1 repository =/= 1 paper  

- think about access: private vs public, and timelines (nice to make repos public eventually) 


## Structuring Repositories for Reproducible Workflows
_best practices of where to put files and why_

_Thinking of projects as packages_  

_sources:_  
- [EFI Task Views](https://ecoforecast.org/introducing-efi-task-views/)    
- [Python Guide Structure](https://docs.python-guide.org/writing/structure/)  
- [Project Workflows](https://www.r-bloggers.com/%F0%9F%93%81-project-oriented-workflow/)  



#### Learn More

**[NEON Version Control with GitHub](https://www.neonscience.org/version-control-git-series)**  


## File Structure and Management

When a potential user or contributor lands on your repository’s page, they see a few things:

- Project Name  
- Project Description  
- Bunch O’ Files  

Only when they scroll below the fold will the user see your project’s README.

If your repo is a massive dump of files or a nested mess of directories, they might look elsewhere before even reading your beautiful documentation.

Dress for the job you want, not the job you have.  

General principle: **someone with sparse knowledge of the project should be able to open it up and after some brief acquaintance be able to run everything themselves.**  


- one root data folder
- one root scripts folder

_Why?_ this makes ease of access from one single .Rproject workspace  


my_project  
|  
-- README.md  
-- ./scripts or ./src  
-------/01_data_extraction  
-------/02_data_curation  
-------/03_data_compilation  
-------/...  
-------/07_analysis  
-- ./docs  
-- ./data  
-- ./figures  
-- ./reports  
-- ./analysis-outputs  


Not the only structure, but I use because:  
- easier to drag and drop data directories into new projects  
- organized by file type: there will never be a .csv in the data folder  
- simple, makes it easier for someone to find readme  
- however, could be more modular  


#### .gitignore

https://github.com/github/gitignore


**Remove DS_Store files**:  

 
#### Licenses

[Software Carpentries recommendations](https://swcarpentry.github.io/managing-research-software-projects/09-license/)  
[choosealicense](https://choosealicense.com/)  
GitHub has templates to choose from. See this [SO post](https://stackoverflow.com/questions/31639059/how-to-add-license-to-an-existing-github-project) for instructions.  

## Naming Directories

But what if you realize you forgot a step, and now have to add another folder as step 03. Then all my other folders change names, and this breaks my file path references in my R code. Well, **not quite** if we plan ahead!

We can refer to scripts with wildcards if we use `Sys.glob()`:  
source(Sys.glob("scripts/*_data_selection/hello_world.R"))  

Same goes with reading in data. We can have multiple wildcards too:  
read.csv(Sys.glob("data/enviro_*eters/data_sources/VanDenHoogen_*.csv"))  

## Documentation and READMEs with Markdown

From Chrome users, see [Markdown Preview Plus](https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl). After install, enable "Allow access to file URLs" in Extensions (menu > More tools > Extensions or enter URL chrome://extensions/ instead). Then drag-n-drop a Markdown file onto Chrome and use your favorite editor to edit.  

### Contents of a root README
- contact info
- short abstract
- some navigational help
- dependencies



### Back to Using Git

#### Commit to the local Repository

**Via the website**:  
Navigate to desired directory, drag 'n drop file(s)  

**Via the Desktop GUI**:  
- Find your designated file, or generate a Markdown readme  
- Navigate to your desired directory, open Terminal/Command Prompt  
- "touch README.md"  
- If we can't get to work, a README.txt is also fine  
- check out this [Markdown syntax guide](https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) for adding some formatted text  

#### Push to the Remote Repository

**Via the Desktop GUI**:  

 
## Reproducible R scripts

_sources:_  
[Jenny Brown](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)  

#### Workflow versus Product  
**Workflow**: personal habitats and accessories  
**Product**: the raw data and the code needed to get your results  


#### Why there is a 10th circle of hell for those that use `setwd()`

The chance of the setwd() command having the desired effect – making the file paths work – for anyone besides its author is exactly 0%.  

_NE MODIFIER PAS LE REPOTOIRE DE TRAVAIL. JAMAIS._  


#### Modularity: producing functions

If you are ever to this action again (and you will), write it as a function. Spend the extra 20% time now to save 100% (ok, 90%) of your time later.  

&nbsp;
&nbsp;
&nbsp;

## Git Large File Storage

https://git-lfs.github.com/


## Signing up for Academic Discounts
https://help.github.com/en/github/teaching-and-learning-with-github-education/applying-for-a-student-developer-pack 


## Challenge

Contributing to SoilTemp: _because the real reason I organized this was to put you all to work!_  

List of data sources:  [see this google spreadsheet](https://docs.google.com/spreadsheets/d/1fVbkRYXmU21g4FV_g9t5_JNL4CzN1SqvT3Esmqq88es/edit?usp=sharing)  


Need to develop hook scripts for geographical/biological/pedological layers, download/subset/reproject/scale/curate. Also need to identify additional pedological layers that I'm not as familiar with– someone spend time on SoilGrids  


Data standards:  

## Literature Organization
- even for citations, machine-readable is better (e.g. .bibtex)  





