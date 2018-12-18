*** s103d10 ***;

proc sql;
title "Average Salary by Gender";
select Employee_Gender as Gender, 
       avg(Salary) as Average
   from orion.employee_information
   where Employee_Term_Date is missing
   group by Employee_Gender;
quit;
title;
