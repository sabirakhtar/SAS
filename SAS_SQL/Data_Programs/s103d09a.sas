*** s103d09a ***;

options nosqlremerge;

proc sql noremerge;
select Employee_Gender, avg(Salary) as Average
   from orion.employee_information
   where Employee_Term_Date is missing;
quit;

options sqlremerge;

proc sql noremerge;
select Employee_Gender, avg(Salary) as Average
   from orion.employee_information
   where Employee_Term_Date is missing;
quit;
