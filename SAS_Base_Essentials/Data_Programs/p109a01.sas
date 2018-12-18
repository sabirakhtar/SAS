data work.comp;
   set orion.sales;
   drop Gender Salary Job_Title Country 
        Birth_Date Hire_Date;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
   BonusMonth=month(Hire_Date);
run;

proc print data=work.comp noobs;
run;
