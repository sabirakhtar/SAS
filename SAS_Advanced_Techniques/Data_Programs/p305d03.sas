data budgetamt;
   drop Yr2007-Yr2011 Month Mon Yr Y M;
   array B{12,2007:2011} _temporary_;
   if _N_=1 then do Mon=1 to 12;
      set orion.budget;
      array cols{2007:2011} Yr2007-Yr2011;
      do Yr=2007 to 2011;
         B{mon,yr}=cols{yr};
     end;
   end;
   set orion.profit(where=(Sales ne .));
   Y=year(YYMM);
   M=month(YYMM);
   BudgetAmt=B{M,Y};
run;
 
proc print data=budgetamt noobs;
   title 'Actual vs Budgeted Amounts';
   format BudgetAmt dollar12.; 
run;

title;
