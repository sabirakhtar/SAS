options msglevel=i;

data allstaff(index=(AgeHired));
   set orion.sales orion.nonsales(rename=(First=FirstName
                                          Last=LastName));
   AgeHired=intck('year',BirthDate,Hiredate,'c');
run;

proc print data=allstaff;
   var EmployeeID BirthDate HireDate AgeHired;
   where AgeHired>30;
run;

options msglevel=n;
