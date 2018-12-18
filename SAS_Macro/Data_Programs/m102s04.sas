/* m102s04 */
title; 
footnote; 

/* Part B */
proc print data=orion.employee_payroll;
   format Birth_Date Employee_Hire_Date date9.;
   where Employee_Hire_Date between '01jan2007'd and "&sysdate"d;
run;
