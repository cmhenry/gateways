Missingness README

This folder contains all of the files needed to take the raw OCR 
data and calculate missingness counts and missingness percentages
needed to plot the missingness data in the shiny app at the state
and county levels.

For our purposes missingness can be defined as students who could
be in gifted education programs but are not because they are either
in schools that do not offer gifted programs, or they are part of a 
group that is under identified in gifted education. 

These files should be run in order of the number of the folder
and the number of the RMD file inside the folder to calculate 
overall missingness and missingness for each group at the state
and county level. 

In general terms missingness is calculated by:

1. Find out the percent of students identified as gifted in each
   state
2. Find the number of students in schools where there is no
   gifted education offered and multiply it by the state average 
   gifted identification rate to find out how many students are 
   missing out on gifted education because there are no programs offered
3. If students are in a group that is underrepresented (identified at a 
   lower rate than the state average) we also need to find out how many 
   more students would be in gifted education if that group was identified
   at the state average. (If the group is identified at a higher rate than
   the state overall identification rate then we consider that number a 0 
   because overrepresentation is not an issue.)
4. We then add the number of students missing from gifted education because
   they are in schools where it is not offered to the number of students not
   in gifted education because they are underrepresented to get a total count
   of the number of students missing overall and for each group
5. We then divide the total number of missing students by the total number
   of students who should be in gifted education (total number of missing 
   students plus the total number of students identified as gifted) to get
   the percent missing. 


Upper bound and lower bound:
  The upper and lower bounds are calculated by looking at the percentage of
  students identified at the state average (lower bound) vs the percentage
  of students identified at non-title one schools (upper bound). Non-title one 
  schools have more wealthy students and are usually identified as gifted
  at a higher rate so that's why we use state average to calculate lower
  bounds and average identification rate at non-title one schools to 
  calculate upper bounds.

If you have any further questions contact:
 Anne Gray: anne.gray@nmt.edu
 or
 Donnie Sengstack: donald.g.sengstack@vanderbilt.edu
