*** s103a03 ***;

proc sql number;
select Employee_Gender, avg(Salary) as Average
   from orion.employee_information
   where Employee_Term_Date is missing
   group by Employee_Gender;
quit;
