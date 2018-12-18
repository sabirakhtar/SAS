proc sort data=orion.employeeaddresses 
          out=employeeaddresses;
   by EmployeeID;
run;

proc sort data=orion.employeeorganization 
          out=employeeorganization;
   by EmployeeID;
run;

proc sort data=orion.employeepayroll out=employeepayroll;
   by EmployeeID;
run;

proc sort data=orion.employeephones out=employeephones;
   by EmployeeID;
run;

data work.employees(compress=char);
   merge employeeaddresses 
         employeeorganization 
         employeepayroll 
         employeephones;
   by EmployeeID;
run;

proc contents data=employees;
run;

data work.employees(compress=binary);
   merge employeeaddresses 
         employeeorganization 
         employeepayroll 
         employeephones;
   by EmployeeID;
run;

proc contents data=employees;
run;

