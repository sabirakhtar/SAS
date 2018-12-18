title; 
footnote; 

proc sort data=orion.staff out=staffhires;
   by Job_Title Emp_Hire_Date;
run;

%let seniority=First; /* Employees with most seniority */
/* %let seniority=Last; Employees with least seniority */

data &seniority.Hired;   
   set staffhires;
   by Job_Title;
   if &seniority..Job_Title;  
run;
proc print data=&seniority.Hired;
   id Job_Title;
   var Employee_ID Emp_Hire_Date;
   title "&seniority Employee Hired within Each Job Title";  
run;

