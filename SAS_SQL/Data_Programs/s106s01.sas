*** s106s01 ***;

proc sql;
title 'Payroll Report for Sales Representatives';
select 'Total Paid to All Female Sales Representatives',
        sum(Salary) format=dollar14., count(*) label='Total'
   from orion.salesstaff
   where gender='F' and  Job_Title like '%Rep%'
union 
select 'Total Paid to All Male Sales Representatives', 
       sum(Salary) format=dollar14., count(*) label='Total'
   from orion.salesstaff
   where gender='M' and Job_Title like '%Rep%';
quit;
title;
