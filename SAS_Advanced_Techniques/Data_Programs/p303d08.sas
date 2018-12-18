proc sort data=orion.employeeaddresses
           out=employeeaddresses;
   by EmployeeID;
run;

proc sort data=orion.employeeorganization
           out=employeeorganization;
   by EmployeeID;
run;

proc sort data=orion.employeepayroll
           out=employeepayroll;
   by EmployeeID;
run;

proc sort data=orion.employeephones
           out=employeephones;
   by EmployeeID;
run;

data empchar(compress=char);
   merge employeeaddresses
         employeeorganization 
         employeepayroll 
         employeephones;
   by EmployeeID;
run;

proc print data=empchar(firstobs=6 obs=10) noobs;
  title "Employee Data Set";
run;
