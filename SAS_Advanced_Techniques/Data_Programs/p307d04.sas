proc sort data=orion.employeeaddresses(keep=EmployeeID EmployeeName)
          out=addresses;
   by EmployeeID;
run;

data temp1;
   keep EmployeeName EmployeeID ManagerID;
   merge orion.staff(in=S keep=EmployeeID ManagerID)
         addresses(in=A);
   by EmployeeID;
   if S and A; /* Matches only */
run;

proc print data=temp1(obs=5) noobs;
run;

proc sort data=temp1;
   by ManagerID;
run;

data names;
   merge temp1(in=T)
         addresses(in=A rename=(EmployeeID=ManagerID
                              EmployeeName=ManagerName));
   by ManagerID;
   if A and T; /* Matches only */
run;

proc print data=names(obs=5) noobs;
   title "Names Data Set";
run;

title;
