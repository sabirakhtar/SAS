*m102e04;

title; 
footnote; 

proc print data=orion.employee_payroll;
   format Birth_Date Employee_Hire_Date date9.;
run;
