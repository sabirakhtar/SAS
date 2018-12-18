data compare;
   drop Month1-Month12 Statistic;
   array mon{12} Month1-Month12;
   if _N_=1 then 
      set orion.retailinformation(where=(Statistic='MedianRetailPrice'));
   set orion.retail;
   Month=month(OrderDate);
   MedianRetailPrice=mon{Month};
   format MedianRetailPrice dollar8.2;
run;

proc print data=compare(obs=5);
  title 'Partial Compare Data Set';
run;

title;
