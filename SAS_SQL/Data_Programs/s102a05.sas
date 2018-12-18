*** s102a05 ***;

proc sql;
select Employee_Name, Employee_ID
   from orion.employee_addresses
   where <insert sql-expression here>;
quit;
