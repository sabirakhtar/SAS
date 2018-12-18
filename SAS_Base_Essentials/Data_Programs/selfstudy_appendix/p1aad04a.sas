data work.december;
   set orion.sales;
   where Country='AU';
   BonusMonth=month(Hire_Date);
   if BonusMonth ne 12 then delete;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
run;

data work.december;
   set orion.sales;
   where Country='AU';
   BonusMonth=month(Hire_Date);
   if BonusMonth=12;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
run;
