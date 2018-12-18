proc sort data=orion.employee_payroll
			 out=work.sort_salary2;
	by Employee_Gender descending Salary;
run;

proc print data=work.sort_salary2;
	by Employee_Gender;
run;
