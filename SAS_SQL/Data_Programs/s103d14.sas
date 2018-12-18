*** s103d14 ***;

proc sql;
title "Manager-to-Employee Ratios";
select Department, 
       sum((find(Job_Title,"manager","i")>0)) 
          as Managers,
       sum((find(Job_Title,"manager","i")=0)) 
          as Employees,
       calculated Managers/calculated Employees 
         "M/E Ratio" format=percent8.1
   from orion.employee_information
   group by Department;
quit;
title;

