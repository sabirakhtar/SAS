proc print data=orion.sales;
run;

proc print data=orion.sales;
	var Last_Name First_Name Salary;
run;

proc print data=orion.sales;
	var Last_Name First_Name Salary;
	sum salary;
run;
