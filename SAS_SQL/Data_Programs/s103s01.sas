*** s103s01 ***;

proc sql; 
title "Single Male Employee Salaries";
select Employee_ID 'Employee ID', 
       Salary format=comma10.2 'Annual Salary', 
       Salary/3 format=comma10.2 as Tax
	      'Federal Tax Withdrawn'
   from orion.employee_payroll
   where Marital_Status="S"
         and Employee_Gender ="M" 
         and Employee_Term_Date is missing
   order by Salary desc;
quit;
title;
