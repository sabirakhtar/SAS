proc summary data=orion.totalsalaries;
   var DeptSal;
   output out=summary sum=GrandTot;
run;

data percent;
   set summary(keep=GrandTot);
   set orion.totalsalaries;
   Percent=DeptSal/GrandTot;
   format percent percent8.2;
run;

proc print data=percent(obs=5);
   title "Percentage of Total Salaries";
   title2 "for Each Manager";
run;

title;
