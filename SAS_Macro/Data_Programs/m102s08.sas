/* m102s08 */
title; 
footnote; 

/* Part A */
%let month=AUG;
%let year=2006;
proc print data=orion.organization_dim;
	where Employee_Hire_Date="01&month&year"d;
	id Employee_Id;
	var Employee_Name Employee_Country Employee_Hire_Date;
	title "Personal Information for Employees Hired in &month &year";
run;

/* Part B */
%let month=JUL;
%let year=2003;
proc print data=orion.organization_dim;
	where Employee_Hire_Date="01&month&year"d;
	id Employee_Id;
	var Employee_Name Employee_Country Employee_Hire_Date;
	title "Personal Information for Employees Hired in &month &year";
run;

