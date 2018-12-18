*** s108s04 ***;

  /* a. */
proc sql;
title "Highest Salary in employee_payroll";
select max(Salary)
   from orion.employee_payroll;
quit;
title;

  /* b. */
%let DataSet=employee_payroll;
%let VariableName=Salary;
%put NOTE:  DataSet=&DataSet, VariableName=&VariableName;


  /* c. */
proc sql;
title "Highest &VariableName in &DataSet";
select max(&VariableName)
   from orion.&DataSet;
quit;
title;

  /* d. */
%let DataSet=Price_List;
%let VariableName=Unit_Sales_Price;
proc sql;
title "Highest &VariableName in &DataSet";
select max(&VariableName)
   from orion.&DataSet;
quit;
title;
