data work.increase;
   set orion.staff;
   Increase=Salary*0.10;
   NewSalary=sum(Salary,Increase);
  /* alternate statement is */
  /* NewSalary=Salary+Increase; */
   BdayQtr=qtr(Birth_Date);
   keep Employee_ID Birth_Date Salary Increase NewSalary BdayQtr;
   format Salary Increase NewSalary comma8.;
run;

proc print data=work.increase label;
run;
