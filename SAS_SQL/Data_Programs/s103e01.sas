*** s103e01 ***;

proc sql; 
select Employee_ID, 
	   Employee_Gender, 
	   Marital_Status,
       Salary , 
       Salary/3 as Tax
   from orion.employee_payroll
   where Marital_Status="S"
	     and Employee_Gender ="M" 
		 and Employee_Term_Date is missing;
quit;
