proc freq data=orion.nonsales2 nlevels order=freq;
   tables Job_Title / nocum nopercent;
run; 
