*** s102d03 ***;

proc sql noexec;
select Employee_ID, Employee_Gender,
       Salary
   from orion.employee_information
   where Employee_Gender='F'
   order by Salary desc;
quit;
