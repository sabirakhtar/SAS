proc print data=orion.sales noobs;
	var Last_Name First_Name Country Job_Title Salary Hire_Date;
run;

proc print data=orion.sales noobs;
	format Salary dollar8. Hire_Date mmddyy10.;
	var Last_Name First_Name Country Job_Title Salary Hire_Date;
run;

