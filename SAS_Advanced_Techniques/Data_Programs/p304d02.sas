proc sort data=orion.orderfact 
          out=SortedOrderFact;
   by descending TotalRetailPrice;
run;
        
data top bottom; 
  set SortedOrderFact(obs=2) end=onlastrow; 
  output top;
  if onlastrow then 
      do ReadOBS=(TotOBS) to (TotOBS - 1) by -1; 
        set SortedOrderFact nobs=TotObs point=ReadOBS;  
        output bottom; 
      end;
run;
 
proc print data=top noobs;
  title 'Top 2 Big Spenders';
  var CustomerID TotalRetailPrice;
run;
 
proc print data=bottom noobs;
  title 'Bottom 2 Frugal Spenders';
  var CustomerID TotalRetailPrice;
run;
 
title;
options nodate nonumber;
