*** s105d01 ***;

/* Step 1 */
proc sql;
select avg(Salary) as CompanyMeanSalary
   from orion.staff;
quit;

  /* Step 2 */
proc sql;
select Job_Title,
       avg(Salary) as MeanSalary
   from orion.staff
   group by Job_Title
   having MeanSalary>38041.51;
quit;
title;
