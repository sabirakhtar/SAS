/* m104s06 */
title; 
footnote; 

/* Part A */
data _null_;
   set orion.country;
   call symputx(Country, Country_Name);
run;
%put _user_;

/* Part C */
%let code=AU;
proc print data=orion.employee_addresses;
   var Employee_Name City;
   where Country="&code";
   title "A List of &&&code Employees";
run;

title;










