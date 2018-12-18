title 'Number of Missing and Non-Missing Date Values';
proc means data=orion.staff nmiss n nonobs;
   var Birth_Date Emp_Hire_Date Emp_Term_Date;
   class Gender;
run;
title;

