*** s102d01 ***;

   *** Simple SQL Select Statement ***;

proc sql;
select Employee_ID, Employee_Gender, Salary
   from orion.employee_information;
quit;

   *** SQL Select Statement with Clauses ***;

proc sql;
select Employee_ID, Employee_Gender, Salary
   from orion.employee_information
   where Employee_Gender='F'
   order by Salary desc;
quit;

