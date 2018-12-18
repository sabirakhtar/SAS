*** s105d05 ***;

  /* < ANY */
proc sql;
title 'Level IV Sales Reps. Who Earn Less Than';
title2 'Any Lower Level Sales Reps.';
select  Employee_ID, Salary
   from orion.staff
   where Job_Title='Sales Rep. IV' 
         and Salary < any 
            (select Salary
                from orion.staff
                where Job_Title in 
                      ('Sales Rep. I','Sales Rep. II',
                       'Sales Rep. III'));
quit;
title;

  /* Equivalent code with MAX statistic */
proc sql;
title 'Level IV Sales Reps Who Earn Less Than';
title2 'Any Lower Level Sales Reps.';
select  Employee_ID, Salary
   from orion.staff
   where Job_Title='Sales Rep. IV'  
         and Salary < 
            (select max(Salary)
                from orion.staff
                where Job_Title in 
                      ('Sales Rep. I','Sales Rep. II',
                       'Sales Rep. III'));
quit;
title;

  /* Equivalent code written with join syntax */
proc sql;
title 'Level IV Sales Reps. Who Earn Less Than';
title2 'Any Lower Level Sales Reps.';
select distinct s1.Employee_ID, s1.Salary
   from orion.staff as s1,
        orion.staff as s2
   where s1.Job_Title="Sales Rep. IV" and
         s1.Salary < s2.Salary and
		 s2.Job_Title in ('Sales Rep. I', 'Sales Rep. II',
		                  'Sales Rep. III');
quit;
title;



