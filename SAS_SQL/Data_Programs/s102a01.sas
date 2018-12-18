*** s102a01 ***; 

  /* Step 1 */
proc sql;
select Employee_ID, Employee_Gender,
        Salary
   from orion.employee_information
   where Employee_Gender='M'
   order by Employee_ID;
quit;

  /* Step 2 */
proc sql;
select Employee_ID, Employee_Gender,
       Salary
   from orion.employee_information
   order by Employee_ID
   where Employee_Gender='M';
quit;
