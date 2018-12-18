*** s108d07 ***;

options symbolgen;
proc sql noprint;
select avg(Salary)
   into :MeanSalary
   from orion.employee_payroll;
%put The average salary is &MeanSalary;
select avg(Salary),min(Salary),max(Salary)
   into :MeanSalary, :MinSalary, :MaxSalary
   from orion.employee_payroll;
%put Mean: &MeanSalary Min: &MinSalary 
     Max: &MaxSalary;
quit;
