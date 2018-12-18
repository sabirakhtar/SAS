*** s103d01 ***;

proc sql;
select Employee_ID, Qtr1
   from orion.employee_donations
   order by Qtr1 desc;
quit;



