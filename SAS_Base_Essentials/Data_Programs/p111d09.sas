proc means data=orion.sales nmiss min max sum;
	var Salary;
	class Gender Country;
run;
