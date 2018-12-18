proc freq data=orion.nonsales2 order=freq;
   tables Employee_ID / nocum nopercent;
run;

proc freq data=orion.nonsales2 nlevels;
   tables Employee_ID / noprint;
run;

proc freq data=orion.nonsales2 nlevels;
   tables _all_ / noprint;
run;


