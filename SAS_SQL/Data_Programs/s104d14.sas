*** s104d14 ***;

proc sql;
select e.Employee_ID "Employee ID", 
       e.Employee_Name "Employee Name",
       m.Employee_ID "Manager ID",
       m.Employee_Name "Manager Name",
       e.Country
   from orion.employee_addresses as e,
        orion.employee_addresses as m,
        orion.employee_organization as o
   where e.Employee_ID=o.Employee_ID and
         o.Manager_ID=m.Employee_ID and 
         Department contains 'Sales'
   order by Country,4,1;
quit;
