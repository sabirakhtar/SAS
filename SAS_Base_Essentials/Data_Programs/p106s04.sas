data work.increase;
   set orion.staff;
   where Emp_Hire_Date>='01JUL2010'd;
   Increase=Salary*0.10;
   if Increase>3000;
   NewSalary=Salary+Increase;
	label Employee_ID='Employee ID'
	      Emp_Hire_Date='Hire Date'
			NewSalary='New Annual Salary';
	format Salary NewSalary dollar10.2 Increase comma5.;
   keep Employee_ID Emp_Hire_Date Salary Increase NewSalary;
run;

proc contents data=work.increase;
run;

proc print data=work.increase split=' ';
run;




