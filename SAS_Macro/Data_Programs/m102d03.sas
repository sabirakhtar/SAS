*m102d03;

%let office=Sydney;
proc print data=orion.Employee_Addresses;
   where City="&office";
   var Employee_Name;
   title "&office Employees";
run;

title;
