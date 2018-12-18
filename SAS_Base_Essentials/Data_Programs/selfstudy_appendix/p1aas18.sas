proc tabulate data=orion.Organization_Dim format=dollar12.
              out=work.salaries;
   class Employee_Gender Company;
   var Salary;
   table Company, (Employee_Gender all)*Salary*mean;
   title 'Average Employee Salaries';
run;

proc sort data=work.salaries;
   by Salary_Mean;
run;

proc print data=work.salaries label;
   var Company Employee_Gender Salary_Mean;
   format Salary_Mean dollar12.;
   label Salary_Mean='Average Salary';
   title 'Average Employee Salaries';
run;
title;
