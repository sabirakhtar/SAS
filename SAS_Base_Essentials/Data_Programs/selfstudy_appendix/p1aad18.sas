 /* Vertical Bar Chart Representing a Frequency Count  */

goptions reset=all;
proc gchart data=orion.staff;
   vbar Job_Title;
   where Job_Title contains 'Rep';
   title 'Number of Employees by Job Title';
run;
quit;
title; 

  /* Three-dimensional Vertical Bar Chart  */
  
goptions reset=all;
proc gchart data=orion.staff;
   vbar3d Job_Title;
   title 'Number of Employees by Job Title';
   where Job_Title contains 'Rep';
run;
quit;
title; 
 
  /* Three-dimensional Horizontal Bar Chart  */
  
goptions reset=all;
proc gchart data=orion.staff;
   hbar3d Job_Title;
   title 'Number of Employees by Job Title';
   where Job_Title contains 'Rep';
run;
quit;
title; 


 /* Suppress the Display of Statistics on Horizontal Bar Charts  */
 
goptions reset=all;
proc gchart data=orion.staff;
   hbar3d Job_Title / nostats;
   title 'Number of Employees by Job Title';
   where Job_Title contains 'Rep';
run;
quit;
title; 

            
 /* Using a Numeric Chart Variable  */ 

goptions reset=all;
proc gchart data=orion.staff;
   vbar3d salary / autoref;
   where Job_Title contains 'Rep';
   format salary dollar9.;
   title 'Salary Distribution Midpoints for Sales Reps';
run;
quit;
title; 

 
 /* Specifying Ranges for a Numeric Chart Variable 
    and Adding Reference Lines  */
 
goptions reset=all;
proc gchart data=orion.staff;
   hbar3d salary/levels=5 range autoref;
   where Job_Title contains 'Rep';
   format salary dollar9.;
   title 'Salary Distribution Ranges for Sales Reps';
run;
quit;
title; 


 /* Creating Bar Charts Based on Statistics  */
 
goptions reset=all;
proc gchart data=orion.staff;
   vbar Job_Title / sumvar=salary type=mean;
   where Job_Title contains 'Rep';
   format salary dollar9.;
   label Job_Title='Job Title'
         Salary='Salary';
   title 'Average Salary by Job Title';
run;
quit;
title; 

   
 /* Assigning a Different Color to Each Bar */

goptions reset=all;
proc gchart data=orion.staff;
   vbar Job_Title / sumvar=salary type=mean patternid=midpoint mean;
   where Job_Title contains 'Rep';
   format salary dollar9.;
   title 'Average Salary by Job Title';
run;
quit; 
title; 

    
 /* Dividing Bars into Subgroups  */

goptions reset=all;
proc gchart data=orion.staff;
   vbar Job_Title/subgroup=Gender;
   where Job_Title contains 'Rep';
   title 'Frequency of Job Title, Broken Down by Gender';
run;
quit;
title; 

     
 /*  Grouping Bars */
 
goptions reset=all;
proc gchart data=orion.staff;
   vbar gender/group=Job_Title patternid=midpoint;
   where Job_Title contains 'Rep';
   title 'Frequency of Job Gender, Grouped by Job Title';
run;
quit;
title; 

 
 /* Creating Multiple Pie Charts Using RUN-Group Processing  */
 
goptions reset=all;
proc gchart data=orion.staff;
   pie Job_Title;
   where Job_Title contains 'Rep';
   title 'Frequency Distribution of Job Titles';
   title2 '2-D Pie Chart';
run;
   pie3d Job_Title / noheading;
   title2 '3-D Pie Chart';
run;
quit;
title; 

