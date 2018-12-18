*** s103d04 ***;

proc sql;
title 'Maximum Quarterly Donation';
select Employee_ID 'Employee ID',
       'Maximum Donation is:',
       max(Qtr1,Qtr2,Qtr3,Qtr4)
         label='Maximum' format=dollar5.
   from orion.employee_donations
   where Paid_By="Cash or Check"
   order by 3 desc, Employee_ID;
quit;
