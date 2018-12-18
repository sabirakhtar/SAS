*** s103d11 ***;

proc sql;
select Department, count(*) as Count
   from orion.employee_information
   group by Department;
quit;
