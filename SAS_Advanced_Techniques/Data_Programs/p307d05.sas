proc sql;
   create table namessql as
   select e.EmployeeID,
          e.EmployeeName,
          ManagerID, 
          m.EmployeeName as ManagerName
       from orion.staff, 
            orion.employeeaddresses as e,
            orion.employeeaddresses as m
       where e.EmployeeID=staff.EmployeeID
         and m.EmployeeID=staff.ManagerID
       order by ManagerID, EmployeeID;
quit;

proc print data=namessql(obs=5) noobs;
   title "Employee and Manager Names";
run;

title;
