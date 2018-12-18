  /* typical SAS/Graph program */

*goptions cback=white;
goptions reset=all;
title 'Number of Employees by Job Title';
proc gchart data=orion.staff;
   vbar Job_Title;
	where Job_Title contains 'Rep';
run;
quit;
title; 

 /* Example of run-group procesing */
proc gchart data=orion.staff;
   vbar Job_Title;
	where Job_Title contains 'Rep';
   title 'Bar Chart of Job Titles';
run;
   pie Job_Title;
   title 'Pie Chart of Job Titles';
run;
quit;
title; 


