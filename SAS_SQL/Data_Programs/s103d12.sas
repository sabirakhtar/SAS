*** s103d12 ***;
 
proc sql;
select Department, count(*) as Count
   from orion.employee_information
   group by Department
   having Count ge 25
   order by Count desc;
quit;
