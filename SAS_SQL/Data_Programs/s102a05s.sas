*** s102a05a ***;

proc sql;  
select Employee_Name, Employee_ID
   from orion.employee_addresses
   where Employee_Name contains ', N'; 

select Employee_Name, Employee_ID
   from orion.employee_addresses
   where Employee_Name like '%, N%'; 

select  Employee_Name, Employee_ID
   from orion.employee_addresses
   where scan(Employee_Name,2,',') like ' N%';

select Employee_Name, Employee_ID
   from orion.employee_addresses
   where substr(scan(Employee_Name,2,','),1,3) contains ' N'; 

quit;
