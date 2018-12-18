data budgetamt;
   drop Y M;
   array B{2,2007:2011} _temporary_
     (1590000, 1880000, 2300000, 1960000, 1970000, 
      1290000, 1550000, 1830000, 1480000, 1640000);
   set orion.profit(where=(Sales ne .)
                    obs=2);
   Y=year(YYMM);
   M=month(YYMM);
   BudgetAmt=B{M,Y};
run;

proc print data=budgetamt noobs;
   title1 "budgetamt Data Set";
run;

title;
