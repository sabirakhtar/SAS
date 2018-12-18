*** s106d03 ***;

proc sql;
title 'Payroll Report for Level I, II, ';
title2 'and III Employees';
select 'Total Paid to ALL Level I Staff', 
       sum(Salary) format=comma12.
   from orion.staff
   where scan(Job_Title,-1,' ')='I'
union 
select 'Total Paid to ALL Level II Staff', 
       sum(Salary) format=comma12. 
   from orion.staff
   where scan(Job_Title,-1,' ')='II'
union
select 'Total Paid to ALL Level III Staff', 
       sum(Salary) format=comma12. 
   from orion.staff
   where scan(Job_Title,-1,' ')='III';
quit;
title;
