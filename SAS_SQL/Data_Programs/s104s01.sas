*** s104s01 ***; 

proc sql;
title "Employees With More Than 30 Years of Service";
title2 "As of February 1, 2013";
select Employee_Name 'Employee Name',
       int(('1FEB2013'd-Employee_Hire_Date)/365.25)
          as YOS 'Years of Service'
   from orion.employee_addresses as a,
        orion.employee_payroll as p
   where a.Employee_ID=p.Employee_ID
         and calculated YOS gt 30
   order by Employee_Name;
quit;
title;
