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

data empsshort;
   length StreetID 6 EmployeeID ManagerID
          StreetNumber EmployeeHireDate
          EmployeeTermDate BirthDate 4
          Dependents 3;
   merge employeeaddresses 
         employeeorganization 
         employeepayroll 
         employeephones;
   by EmployeeID;
run;

proc contents data=empsshort position;
run;

 /* Create comparison data set */
data emps;
   merge employeeaddresses 
         employeeorganization 
         employeepayroll 
         employeephones;
   by EmployeeID;
run;

proc contents data=emps position;
run;

 /* Compare emps and empsshort */
proc compare data=emps compare=empsshort;
run;
