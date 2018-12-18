*** s104s06 ***;

proc sql;
title 'Trainee and Temporary Employees';
select a1.Employee_ID 'Employee ID',
       a1.Employee_Name 'Employee_ Name',
	   Job_Title,
       a2.Employee_ID 'Manager ID',
	   a2.Employee_Name 'Manager Name'
   from orion.employee_addresses as a1,
        orion.employee_addresses as a2,
        orion.staff as s
   where a1.Employee_ID=s.Employee_ID and
         s.Manager_ID=a2.Employee_ID and
		 (Job_Title contains 'Trainee' or
		  Job_Title contains 'Temp')
   order by a1.Employee_ID;
quit;
title;
