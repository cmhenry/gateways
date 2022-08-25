# Data Science for Social Good: GATEways
This repository manages the DSSG GATEways project.

# Quick navigation
[Background](#background)  
[Data](#data)  
[Models](#models)  
[Timeline and Deliverables](#timeline-and-deliverables)  
[Logistics](#project-logistics)  

# Goal
- Read and prepare data from primary information files in a reproducible manner.
- Build an interactive dashboard using Shiny to display national, state, and district level information.
- Build predictive model to estimate number of missing students. 
- Stretch Goal: Develop simulation to explore policy implications.

# Background  

Black students and students of color are underrepresented in Gifted and Talented Education (GATE) pograms. Research indicates there are 3.5 millions students missing from these programs nationwide. In this project we will build tools that will enable educators and policymakers  to estimate the number of students denied access in their area, and to estimate the economic and societal impact of stronger and more inclusive policies. This project involves the creation of interactive visualization dashboards in Shiny, the building and training of predictive machine learning models, and the development of simulations to explore policy implications. Our partner is Prof. Gil Whiting, Associate Professor of African American and Diaspora Studies, Director of the Scholar Identity Institute. See https://www.education.purdue.edu/geri/new-publications/gifted-education-in-the-united-states/

Previous work on developing a dashboard similar to this has been done by Will Doyle, and can be found at https://github.com/wdoyle42/gifted_maps/.

# Data

Access Denied Data: https://ocrdata.ed.gov  
Box Repository: https://vanderbilt.box.com/v/DSSGgateways  
Will Doyle's Repository: https://github.com/wdoyle42/gifted_maps/


## Data Notes:

- Schools are designated as Title I, and receive federal funds, when 40% or more of students qualify for free or reduced lunch.
- 4.35% of schools in 2015-2016 did not have their Title I status listed.
- Less than 5% of schools were missing their locale data in 2015-2016.
- Less than 5% of students in Massachusetts, Rhode Island, and Vermont, and no students in the District of Columbia, had access to GATE identification in 2015-2016. In our analysis of data for this year we included the data for these states as informational only.

## Data security

Data can be found publicly on the internet.

## Counts

Describe the overall size of the dataset and the relative ratio of positive/negative examples for each of the response variables.

# Models

Clearly identify each of the response variables of interest.  Any additional desired analysis should also be described here.

# Timeline and Deliverables

Provide a timeline for the project and deadlines for specific deliverables.

Start of Project: June 7th, 2021

Project Deadline: August 13th, 2021

# Repo Structure

Give a description of how the repository is structured. Example structure description below:

The repo is structured as follows: All *0- (e.g., 10-, 20-, 30-) files contain finalized work for the purpose described (e.g., "process-data"). Subfiles related to the task (e.g., 11-, 12-) should be created in order to explore and document relevant or interesting subtasks.

All files which appear in the repo should be able to run, and not contain error or blank cell lines, even if they are relatively midway in development of the proposed task. All notebooks relating to the analysis should have a numerical prefix (e.g., 31-) followed by the exploration (e.g. 31-text-labeling). Any utility notebooks should not be numbered, but be named according to their purpose. All notebooks should have lowercase and hyphenated titles (e.g., 10-process-data not 10-Process-Data). All notebooks should adhere to literate programming practices (i.e., markdown writing to describe problems, assumptions, conclusions) and provide adequate although not superfluous code comments.

Please note that files 12-14 are used to develop functions that are later sourced in the following files and are not designed to be run. 

# Project logistics

**Sprint planning**:  
**Demo**: Fridays from 2:00 to 3:00 at [Zoom Link](https://vanderbilt.zoom.us/j/93077638038?pwd=K09YMWVnWGtpSzFUNCt0UXFlWG5RQT09&from=addon)

**Data location**:  
https://vanderbilt.box.com/s/vd2tblqnwflme24mfuxet91auc8kmwm7

**Dashboard Wireframe**:
Slide Doc: https://docs.google.com/presentation/d/1ArYx7MJ0cONI3S-xWsG4tDHzo5620BWp0Lf6YnjLBZo/edit#slide=id.p

**Slack channel**:  
https://datasciencetip.slack.com/archives/C022S6LB1J8

**Zoom link**:  
Mondays 9:00-10:30 AM Central Time  
https://vanderbilt.zoom.us/j/95343816270

# Resources

- Shiny Tutorial: https://shiny.rstudio.com/tutorial/
- Shiny Reference: https://shiny.rstudio.com/reference/shiny/

# Contact Info

Gilman Whiting, PhD (Dr. G.)  
Associate Professor, African American and Diaspora Studies
Director of the Scholar Identity Institute
g.whiting@vanderbilt.edu

Anne Gray, PhD.  
Education Assessment Specialist, New Mexico Institute of Mining and Technology  
anne.gray@nmt.edu


Jesse Spencer-Smith  
Chief Data Scientist, Data Science Institute  
jesse.spencer-smith@vanderbilt.edu


Charreau Bell  
Senior Data Scientist, Data Science Institute  
charreau.s.bell@vanderbilt.edu


Umang Chaudhry  
Project Lead, Data Science Institute  
umang.chaudhry@vanderbilt.edu


Josh Rehders  
Project Assistant, Data Science Institute  
josh.rehders@vanderbilt.edu


Preston Abraham  
Data Science Team Intern, Data Science Institute  
preston.d.abraham@vanderbilt.edu  
