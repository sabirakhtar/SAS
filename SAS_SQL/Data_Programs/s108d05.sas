*** s108d05 ***;

%let DSN=employee_payroll;
%let bigsalary=100000;

%put DSN is &DSN;
%put bigsalary is &bigsalary;

options symbolgen;
proc sql;
title "Salaries > &bigsalary";
select  Employee_ID, Salary
   from orion.&DSN
   where Salary > &bigsalary;
quit;
title;
