proc means data=orion.sales;
run; 

proc means data=orion.sales;
	var Salary;
run; 

proc means data=orion.sales n mean;
	var Salary;
run; 

