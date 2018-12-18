proc sort data=orion.totalsalaries 
          out=SortedTotalSalaries;
   by DeptSal;
run; 
 
data lowest highest;
   do ReadOBS=1 to 5;
      set SortedTotalSalaries;
      output lowest;
   end;
   do ReadOBS=(TotOBS) to (TotOBS - 4) by -1; 
      set SortedTotalSalaries nobs=TotObs point=ReadOBS;  
      output highest; 
   end;
   stop;
run;
 
proc print data=highest noobs;
  title 'Top 5 Salary Groups';
run;
 
proc print data=lowest noobs;
  title 'Bottom 5 Salary Groups';
run;
 
title;
