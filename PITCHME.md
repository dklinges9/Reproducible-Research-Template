# Flux 

An application architecture for React

---

### Flux Design

- Dispatcher: Manages Data Flow
- Stores: Handle State & Logic
- Views: Render Data via React

---

![Flux Explained](https://facebook.github.io/flux/img/flux-simple-f8-diagram-explained-1300w.png)


---

## Structuring Repositories for Reproducible Workflows (_15 mins_)  
_Good practices of where to put files and why_
  
_sources:_  
- [EFI Task Views: Reproducible Forecasting Workflows](https://ecoforecast.org/reproducible-forecasting-workflows/)    
- [Python Guide Structure](https://docs.python-guide.org/writing/structure/)  
- [Project Workflows](https://www.r-bloggers.com/%F0%9F%93%81-project-oriented-workflow/)  
- [What They Forgot to Teach You About R: a textbook](https://rstats.wtf/)  


---

### Items
- What is reproducibility and why?  
- Organizing files for reproducibility  
- Organizing R code for reproducibility  

&nbsp;
&nbsp;

---

### What is reproducibility and why?  


What: We should think of our projects as self-contained packages (much like an R package) that can be ddownloaded/imported by others and, for the most part, understood by them too. "Ideally a collaborator should be able to run the entire project without changing any code or files" ([source](https://ecoforecast.org/reproducible-forecasting-workflows/)). Working towards FAIR principles (Wilkinson et al. 2016)  

Who: for others, but oftentimes for ourselves. 

Why: 
- Well, for six months from now when you need to open up your code again from a paper back from review, and you haven't thought about the project since. 
- But also, it seems the field is (luckily) moving towards encouraging (and maybe soon mandating) that the whole project workflow is published. As in, we've long been accustomed to publishing our papers (interpretation of the findings) and our getting better at publishing our data (the findings themselves), the next step is publishing our code (how we connected the findings to the interpretation).  

&nbsp;

---

When a potential user or contributor lands on your repository’s page, they see a few things:

- Project Name  
- Project Description  
- Bunch O’ Files  

Only when they scroll below the fold will the user see your project’s README.

If your repo is a massive dump of files or a nested mess of directories, they might look elsewhere before even reading your beautiful documentation.

Dress for the job you want, not the job you have.  

---


![](images/someone_elses_files.png)   

&nbsp;

---

General principle: **someone with sparse knowledge of the project should be able to open it up and after some brief acquaintance be able to run everything themselves.**  
_Thinking of projects as packages_  

&nbsp;
&nbsp;

---

#### Proposed Project Template 

my_project  
|  
-- README.md  
-- ./data 
-- ./docs  
-- ./scripts  
-------/01_data_extraction  
-------/02_data_curation  
-------/03_data_compilation  
-------/...  
-------/07_analysis  
-- ./figures  
-- ./reports  
-- ./analysis-outputs  

(_drop links to repos again if desired_)  

---


Not the only structure, but generally I use this.  

_Pros_:  
- easier to drag and drop data directories into new projects  
- organized by file type: there will never be a .csv in the scripts folder. I think this is easy to find files  
- easier to .gitignore or git-lfs large files if they are all stored in the same directory  
- simple, makes it easier for someone to find readme  

_Cons_:  
- data is often intrinsically linked to code. Naturally, certain data and code files should be sorted together.  
- could be more modular  
- for especially large projects, impossible to attempt to sort through a single directory that stores ALL of the code or ALL of the data without linking to each other  

---

**Main takeaway**: there is no single template to fit all projects or needs. What we should strive to do is structure our projects in a way that is intuitive to a large audience but also familiar to a more specialized audience.  


&nbsp;
&nbsp;

---


## Documentation and READMEs with Markdown

READMEs will be the first thing that most developers/researchers will look at (hopefully). Make them simple and to the point.  

### Contents of a root README
- contact info
- short abstract
- some navigational help
- dependencies

&nbsp;  

---

#### Markdown Formatting

`# create a header`
# Create a header

&nbsp;

---

`### smaller header`
### smaller header  

&nbsp;

---

`**bold text**`  
**bold text**  

&nbsp;

---

`add two spaces" "" " `  
`to create a line break`  
add two spaces  
to create a line break

&nbsp;

---

`[text for your link](https://soiltemp.weebly.com/)`  
[text for your link](https://soiltemp.weebly.com/)  

&nbsp;

---

From Chrome users, see [Markdown Preview Plus](https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl). After install, enable "Allow access to file URLs" in Extensions (menu > More tools > Extensions or enter URL chrome://extensions/ instead). Then drag-n-drop a Markdown file onto Chrome and use your favorite editor to edit.  


---

**Markdown guides**  :
[Markdown Cheatsheet](https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) for adding some formatted text  
[Syntax Guide](https://guides.github.com/features/mastering-markdown/)  
[Intro to RMarkdown](https://rmarkdown.rstudio.com/articles_intro.html)  

&nbsp; 

---

### **Exercise: everyone add a README**  

- Find your designated file, or generate a Markdown readme  
- Navigate to your desired directory, open Terminal/Command Prompt  
- "touch README.md"  
- If we can't get to work, a README.txt is also fine  
- can also add a directory: but note an empty folder doesn't exist to Git  

&nbsp;

---


##### Learn More
**[NEON Version Control with GitHub](https://www.neonscience.org/version-control-git-series)**  


&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp; 

---

## Break (_15 mins_)  

While we're gone, could install [Git LFS](https://git-lfs.github.com/)  
- (_see [these instrutions](https://help.github.com/en/github/managing-large-files/installing-git-large-file-storage)_) 

&nbsp;
&nbsp;
&nbsp;
&nbsp;

---

## Reproducible R scripts

_sources:_  
[Jenny Brown](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)  

---

#### R Scripts as part of a Project Ecosystem
_Thinking of projects as packages_   

- scripts should be organized with awareness of your project space: self-contained projects as folders  
- every script assumes that:
	- the working directory will be set to this folder  
	- there will be nothing already loaded in the R environment  
	- it will install/load only what is needed (for data and packages)  


Not just good for GitHub....not just good for collaborators....more portable for future self.  

&nbsp;

---

#### Workflow versus Product  
**Workflow**: personal habitats and accessories  
**Product**: the raw data and the code needed to get your results  

&nbsp;
&nbsp;
&nbsp;
&nbsp;

---

### Transitioning to RStudio
_A few tips 'n tricks to make coding in a portable repository easier_  

**Navigate to RStudio**  
**Set up an R Project**  

---

#### Why there is a 10th circle of hell for those that use `setwd()`

The chance of the setwd() command having the desired effect – making the file paths work – for anyone besides its author is exactly 0%.  

---

![](images/setwd_fire.png)  

_NE MODIFIER PAS LE REPOTOIRE DE TRAVAIL AVEC `SETWD()`. JAMAIS._  

&nbsp;
&nbsp;

---

#### Flexible reference to directories

Workspaces are inherently dynamic: files and folders are always changing. We should code that is flexible for these changes.  

_Recall that we named our directories "01_XXX", "02_YYY", "03_ZZZ, etc..._  
But what if you realize you forgot a step, and now have to add another folder as step 02. Then all my other folders change names, and this breaks my file path references in my R code. Well, **not quite** if we plan ahead!  


We can refer to scripts with wildcards if we use `Sys.glob()`:  
source(Sys.glob("scripts/*_data_selection/hello_world.R"))  

Same goes with reading in data. We can have multiple wildcards too:  
read.csv(Sys.glob("data/enviro_*eters/data_sources/VanDenHoogen_*.csv"))  

---


#### Modularity: producing functions

If you are ever to this action again (and you will), write it as a function. Spend the extra 20% time now to save 100% (ok, 90%) of your time later.  

&nbsp;
&nbsp;
&nbsp;

---

#### Some RStudio formatting options

##### [use headers to fold code sections](https://support.rstudio.com/hc/en-us/articles/200484568-Code-Folding-and-Sections) 
- *Collapse* — Alt+L  
- *Expand* — Shift+Alt+L  
- *Collapse All — Alt+O  
- *Expand All* — Shift+Alt+O  
- *Insert Section* — Ctrl+Shift+R (Cmd+Shift+R on the Mac)  
- *Jump To Section* — Shift+Alt+J  


---


### Using Packrat for package management 

_Need to develop this content._  


---

#### Related Resources

Workflow and Dependency Management:  
- [Drake](https://github.com/ropensci/drake) is built for R  
- [here's a more extensive list](https://github.com/common-workflow-language/common-workflow-language/wiki/Existing-Workflow-systems) as well  

Continuous Integration and Automation:  
- this [EFI Tasks Views blog post](https://ecoforecast.org/reproducible-forecasting-workflows/) has some good info on this  

---


### Alternatives to Git for file version control


Learning Git is hard. It's not for everyone, which is understandable. If we are solely reliant upon Git for file version control, and GitHub for storing/sharing our projects, we may exclude valuable collaborators who otherwise could contribute substantially.  

**Sometimes we can be flexible in the platforms we use, or how we code, to accommodate out collaborators.**  

---

`googlesheets4` package:  

What if you have a collaborative data file, but don't need to collaborate on the code? This is a helpful package.  

I used this recently for when a collaborator wasn't as comfortable with Git, and wanted to add data to a Google Sheet. No problem! I can automatically download the most recent version of the data on Sheets (much like `git pull`)  

**Demonstrate sample R script from vert strat meta**  



