*m102e10;

title; 
footnote; 

proc sort data=orion.staff out=staffhires;
   by Job_Title Emp_Hire_Date;
run;

data FirstHired;   
   set staffhires;
   by Job_Title;
   if First.Job_Title;  
run;

proc print data=FirstHired;
   id Job_Title;
   var Employee_ID Emp_Hire_Date;
   title "First Employee Hired within Each Job Title";  
run;

title; 
