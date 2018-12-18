proc freq data=orion.nonsales2;
   tables Gender Country / nocum nopercent;
run;

proc freq data=orion.nonsales2 nlevels;
   tables Gender Country / nocum nopercent;
run;



