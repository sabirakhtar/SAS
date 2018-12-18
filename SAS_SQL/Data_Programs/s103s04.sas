*** s103s04 ***;

proc sql;
title "Cities Where Employees Live";
select City, Count(*) as Count
   from orion.employee_addresses
   group by City
   order by City;
quit;
title;
