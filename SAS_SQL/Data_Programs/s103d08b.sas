*** s103d08b ***;

proc sql;
select count(distinct Manager_ID) as Count
   from orion.employee_information
   where Employee_Term_Date is missing;
quit;
