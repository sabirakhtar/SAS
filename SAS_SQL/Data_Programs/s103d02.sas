*** s103d02 ***;

proc sql;
select Employee_ID,
       max(Qtr1,Qtr2,Qtr3,Qtr4)	
   from orion.employee_donations
   where Paid_By="Cash or Check"
   order by 2 desc, Employee_ID;
quit;
