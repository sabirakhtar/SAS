*** s102d15 ***;

  /* Try to subset by referencing a new column with its alias */
proc sql;
select Employee_ID, Employee_Gender, Salary, 
       Salary*.10 as Bonus
   from orion.employee_information
   where Bonus<3000;
quit;

  /* Subset by repeating the calculation (not efficient) */
proc sql;
select Employee_ID, Employee_Gender, Salary, 
       Salary*.10 as Bonus
   from orion.employee_information
   where Salary*.10<3000;
quit;

 /* Subset using the calculated keyword */
proc sql;
select Employee_ID, Employee_Gender, 
       Salary, Salary*.10 as Bonus
   from orion.employee_information
   where calculated Bonus<3000;
quit;

  /* refer to a column by its alias in the select clause */
proc sql;
select Employee_ID, Employee_Gender,
       Salary, Salary*.10 as Bonus,
       calculated Bonus/2 as Half
   from orion.employee_information
   where calculated Bonus<3000;
quit;

 /* refer to calculated character columns using */
 /* the CALCULATED keyword */

proc sql;
select Employee_ID, Salary,
       (scan(Job_Title,-1,' ')) as Job_Level
   from orion.employee_information
   where calculated Job_Level='IV';
quit;
