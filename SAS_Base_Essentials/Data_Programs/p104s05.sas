proc sort data=orion.employee_payroll
			 out=work.sort_salary;
	by Salary;
run;
proc print data=work.sort_salary;
run;
