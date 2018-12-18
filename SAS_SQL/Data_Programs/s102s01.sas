*** s102s01 ***;
 /*a*/

proc sql;
select *
   from orion.employee_payroll;
quit;

  /*b*/ 
proc sql; 
select Employee_ID, Employee_Gender, Marital_Status, Salary
   from orion.employee_payroll;
quit;
