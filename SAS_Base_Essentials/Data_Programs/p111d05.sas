proc freq data=orion.sales;
	tables Hire_Date / nocum;
	format Hire_Date date9.;
run;

proc freq data=orion.sales;
	tables Hire_Date / nocum;
	format Hire_Date year4.;
run;

