*** s105d06 ***;

proc sql;
title  'Sales Department Average Salary'; 
title2 'By Job Title';
   select Job_Title, 
          avg(Salary) as Job_Avg 
      from orion.Employee_Payroll as p, 
           orion.Employee_Organization as o
      where p.Employee_ID=o.Employee_ID
            and Employee_Term_Date is missing
            and Department="Sales"
      group by Job_Title;
quit;
title;
