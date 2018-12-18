*** s102a02 ***; 

proc sql;
validate
select Employee_ID, Employee_Gender,
       Salary
   from orion.employee_information
   where Employee_Gender='M'
   order by Employee_ID;
quit;




