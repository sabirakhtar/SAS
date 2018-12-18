proc print data=orion.sales;
	var Last_Name First_Name Salary;
	where Salary<25500;
run;

proc print data=orion.sales noobs;
	var Last_Name First_Name Salary;
	where Salary<25500;
run;


