proc format;
   value salgrp 
       low-<30000 = 'Under $30,000'
     30000-<35000 = '$30,000 to $35,000'
	 35000-<50000 = '$35,000 to $50,000'
	   50000-high = 'Over $50,000';
run;

proc sort data=orion.employeepayroll out=sorted;
   by salary;
run;

data highlowsal;
   set sorted;
   by groupformat salary;
   format salary salgrp.;
   Salgroup=put(salary,salgrp.);
   if first.salary or last.salary; 
run;

title 'Lowest and Highest Salary';
Title2 'by Salary Group';
proc print data=highlowsal label;
    id SalGroup;
    by SalGroup notsorted;
    var Salary EmployeeID;
    format salary dollar9.;
	label salgroup='Salary Group';
run;


title;
