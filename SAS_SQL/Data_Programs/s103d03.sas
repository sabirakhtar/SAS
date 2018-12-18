*** s103d03 ***;

proc sql;
select Employee_ID 'Employee ID',
       max(Qtr1,Qtr2,Qtr3,Qtr4)
          label='Maximum' format=dollar5.
   from orion.employee_donations
   where Paid_By="Cash or Check"
   order by 2 desc, Employee_ID;
quit;
