/* m104e06 */
title; 
footnote; 

%let code=AU;
proc print data=Orion.Employee_Addresses;
   var Employee_Name City;
   where Country="&code";
   title "A List of xxxxx Employees";
run;




