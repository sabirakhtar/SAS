*** s102d07 ***;

proc sql;
select Employee_ID, Salary,
       Salary*.10 as Bonus
   from orion.employee_information;
quit;
