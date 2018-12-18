data percent(drop=i);
   if _N_=1 then do i=1 to TotObs;
      set orion.totalsalaries(keep=DeptSal)
          nobs=TotObs;
      GrandTot+DeptSal;
   end;
   set orion.totalsalaries;
   Percent=DeptSal/GrandTot;
   format Percent percent8.2;
run;

proc print data=percent(obs=5) noobs;
   title "Percentsql Data Set";
quit;
