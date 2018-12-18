 /* DATA step solution */
data underforty fortyplus;
   drop i SampSize;
   SampSize=50;
   do i=1 to SampSize;
      PickIt=ceil(ranuni(0) * TotObs);
      set orion.customerdim point=PickIt nobs=TotObs;
      if CustomerAge < 40 then output underforty;
         else output fortyplus;
    end;
    stop;
run;

proc print data=fortyplus noobs; 
   title 'Customers Forty or Older';
   var CustomerID CustomerName;
run;

proc print data=underforty noobs; 
   title 'Customers under Forty';
   var CustomerID CustomerName;
run;
