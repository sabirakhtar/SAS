*** s108a03 ***;

%let Dept=Sales;
proc sql noprint;
select avg(Salary) 
   into :MeanSalary
   from orion.employee_payroll as p,
        orion.employee_organization as o
   where p.Employee_ID=O.Employee_ID
         and Department=Propcase("&Dept");
reset print number;
title "&Dept Department Employees Earning";
title2 "More than the Department Average "
       "of &meansalary";
select p.Employee_ID, Salary
   from orion.employee_payroll as p,
        orion.employee_organization as o
   where p.Employee_ID=O.Employee_ID
         and Department=Propcase("&Dept")
         and Salary>&meansalary;
quit;
title;
