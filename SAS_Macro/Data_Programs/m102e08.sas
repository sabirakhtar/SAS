*m102e08;

title; 
footnote; 

proc print data=orion.organization_dim;
   where Employee_Hire_Date='01AUG2006'd;
   id Employee_ID;
   var Employee_Name Employee_Country Employee_Hire_Date;
   title 'Personal Information for Employees Hired in AUG 2006';
run;

title; 
