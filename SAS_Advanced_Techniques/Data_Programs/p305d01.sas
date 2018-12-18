data compare;
   keep EmployeeID YearHired Salary 
      Average SalaryDif;
   format Salary Average SalaryDif dollar12.2;
   array yr{1978:2011} Yr1978-Yr2011;
   if _n_=1 then set orion.salarystats(where=(Statistic='AvgSalary'));
   set orion.employeepayroll
     (keep=EmployeeID EmployeeHireDate Salary);
   YearHired=year(EmployeeHireDate);
   Average=yr{YearHired};
   SalaryDif=Salary-Average;
run;

proc print data=compare(obs=5);
   var EmployeeID YearHired Salary Average SalaryDif;
   title 'Using One Dimensional Arrays';
run;
