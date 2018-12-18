*** s103d13 ***;

proc sql;
select Department, Job_Title,
       (find(Job_Title,"manager","i")>0) 
       "Manager" 
   from orion.employee_information;
quit;
