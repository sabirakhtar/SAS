*** s103d08a ***;

proc sql;
select count(*) as Count
   from orion.employee_information
   where Employee_Term_Date is missing;
quit;


