*** s103a02 ***;

  /* Step 1 */
proc sql;
select 'The Average Salary is:', 
       avg(Salary)
   from orion.employee_information
   where Employee_Term_Date is missing;
quit;

  /* Step 2 */
proc sql number ;
select Employee_Gender, 
       avg(Salary) as Average
   from orion.employee_information
   where Employee_Term_Date is missing;
quit;
