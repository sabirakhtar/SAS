*** s103s05 ***;

proc sql;
title "Age at Employment";
select Employee_ID 'Employee ID', 
       Birth_Date format=mmddyy10. 'Birth Date', 
       Employee_Hire_Date format=mmddyy10. 'Hire Date', 
       int((Employee_Hire_Date-Birth_Date)/365.25) as Age        'Age'
   from orion.employee_payroll;
quit;
title;
