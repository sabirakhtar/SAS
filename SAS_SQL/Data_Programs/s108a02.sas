*** s108a02 ***;

%let city=San Diego;

title "Report for &City";
proc sql;
select Employee_id, Employee_Name, City
   from orion.employee_addresses
   where city="&city";
quit;


%let city='San Diego';

title "Report for &City";
proc sql;
select Employee_id, Employee_Name, City
   from orion.employee_addresses
   where city="&city";
quit;
