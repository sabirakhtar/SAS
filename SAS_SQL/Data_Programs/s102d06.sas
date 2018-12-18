*** s102d06 ***;

proc sql;
select Employee_ID, Employee_Gender,
       Salary
   from orion.employee_information;
quit;
