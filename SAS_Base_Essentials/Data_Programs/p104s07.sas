proc sort data=orion.employee_payroll
			 out=work.sort_sal;
	by Employee_Gender descending Salary;
run;

proc print data=work.sort_sal noobs;
	by Employee_Gender;
	sum Salary;
	where Employee_Term_Date is missing and Salary>65000;
	var Employee_ID Salary Marital_Status;
 run;
