proc univariate data=orion.nonsales2;
	var Salary;
run;

*********** NEXTROBS=3 *************;
proc univariate data=orion.nonsales2 nextrobs=3;
	var Salary;
run;

*********** ID *************;
proc univariate data=orion.nonsales2;
	var Salary;
	id Employee_ID;
run;


