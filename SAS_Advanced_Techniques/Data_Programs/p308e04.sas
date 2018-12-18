
data sales_staff;
   infile "&path\sales1.dat"; 
   input  @1 Employee_ID 6.
         @40 Gender $1.
         @43 Job_Title $20.
         @64 Salary Dollar8.
		 @73 Country $2.
         @87 Hire_Date mmddyy10.;
run;



