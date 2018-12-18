*** s108d06 ***;

%let Dept=Sales;
proc sql noprint;
select avg(Salary) 
   into :MeanSalary
   from orion.employee_payroll as p,
        orion.employee_organization as o
   where p.Employee_ID=O.Employee_ID
         and Department=propcase("&Dept");
reset print number;
title  "&Dept Department Employees Earning";
title2 "More than the Department Average "
       "of &MeanSalary";
select p.Employee_ID, Salary
   from orion.employee_payroll as p,
        orion.employee_organization as o
   where p.Employee_ID=O.Employee_ID
         and Department=Propcase("&Dept")
         and Salary > &MeanSalary;
quit;
title;
