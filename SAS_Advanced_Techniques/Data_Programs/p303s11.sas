proc sql;
   create view orion.payrolldonations as
      select EmployeeID, Qtr1, Qtr2, Qtr3, Qtr4, 
             sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalDonations
         from orion.employeedonations
            where PaidBy='Payroll Deduction'
               using libname orion "&path";
quit;

 /* Part c */
libname orion clear;

 /* Part d */
libname sasdata "&path"; * Windows/UNIX LIBNAME;

 /* Part e */
proc print data=sasdata.payrolldonations(obs=5) noobs;
   title 'payrolldonations View';
run;

 /* Part f */
libname sasdata clear;

 /* Part g */
/*reassign orion library*/
libname orion "&path";
