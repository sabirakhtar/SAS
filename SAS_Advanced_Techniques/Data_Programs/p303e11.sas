libname orion clear;

proc sql;
   create view orion.payrolldonations as
      select EmployeeID, Qtr1, Qtr2, Qtr3, Qtr4, 
             sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalDonations
         from orion.employeedonations
            where PaidBy='Payroll Deduction';
quit;

proc print data=orion.payrolldonations(obs=5) noobs;
   title 'payrolldonations View';
run;

title;




