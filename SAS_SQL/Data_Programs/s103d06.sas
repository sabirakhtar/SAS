*** s103d06 ***;

proc sql;
select Employee_ID 
       label='Employee Identifier',
       Qtr1,Qtr2,Qtr3,Qtr4,
       sum(Qtr1,Qtr2,Qtr3,Qtr4) 
       label='Annual Donation' 
       format=dollar5.
   from orion.employee_donations
   where Paid_By="Cash or Check"
   order by 6 desc;
quit;
