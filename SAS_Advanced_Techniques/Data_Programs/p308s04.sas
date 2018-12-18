proc format library=orion;
 invalue $gender (upcase)
           'M'='Male'
		   'F'='Female';
 invalue $country (upcase)
           'AU'='Australia'
		   'US'='United States';
run;

options fmtsearch=(orion);

data sales_staff;
   infile "&path\sales1.dat"; 
   input  @1 Employee_ID 6.
         @40 Gender :$gender.
         @43 Job_Title $20.
         @64 Salary Dollar8.
		 @73 Country :$country.
         @87 Hire_Date mmddyy10.;
run;

title 'Australian and US Sales Staff';
proc print data=sales_staff(obs=5) noobs;
run;
title;
